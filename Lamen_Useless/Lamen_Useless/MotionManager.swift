//
//  MotionManager.swift
//  Lamen_Useless
//
//  Created by Nathalia Melare on 20/04/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//


import UIKit
import CoreMotion
import AVFoundation

class MotionManager: NSObject {
    
    var animator: UIDynamicAnimator
    let motion = CMMotionManager()
    let gravity = UIGravityBehavior()
    let collider = UICollisionBehavior()
    let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
    var snap: UISnapBehavior!
    var player: AVAudioPlayer?

    init(view: UIView) {
        animator = UIDynamicAnimator(referenceView: view)
        
        super.init()
        impactFeedbackGenerator.prepare()
        collider.collisionDelegate = self
        collider.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collider)
        animator.addBehavior(gravity)
    }
    
    func startDeviceMotion() {
        if motion.isDeviceMotionAvailable {
            self.motion.deviceMotionUpdateInterval = 1.0 / 60.0
            self.motion.showsDeviceMovementDisplay = true
            self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
            let timer = Timer(
                fire: Date(),
                interval: (1.0 / 60.0),
                repeats: true,
                block: { (timer) in
                    if let data = self.motion.deviceMotion {
                        let grav = data.gravity
                
                        let x = CGFloat(grav.x)
                        let y = CGFloat(grav.y)
                        let v = CGVector(dx: x, dy: y)
                        self.gravity.gravityDirection = v
                    }
            })
            
            RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
        }
    }

}

extension MotionManager: UICollisionBehaviorDelegate {
        
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        impactFeedbackGenerator.impactOccurred()
    }
    
}

