//
//  ViewController.swift
//  Lamen_Useless
//
//  Created by Nathalia Melare on 16/04/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    
    let lamenArray = UIImage.animatedImageNamed("Comendo", duration: 0.8)
    let startLamen = UIImage.animatedImageNamed("Inicial", duration: 0.8)
    
    var tap: UITapGestureRecognizer!
    
    var motionManager: MotionManager?
    var ball: CustomBall?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager = MotionManager(view: self.view)
        motionManager?.startDeviceMotion()
        
        ball = CustomBall(position: CGPoint(x: 0, y: 0 ), color: .cyan, image: UIImage(named: "Frame 3")!)
        self.view.insertSubview(ball!, at: 0)
                
        motionManager?.collider.addItem(ball!)
        motionManager?.gravity.addItem(ball!)
        
    }
    
    
     override func viewWillDisappear(_ animated: Bool) {
         motionManager?.motion.stopDeviceMotionUpdates()
     }
     
     override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
         return UIRectEdge.all
     }
     
     override var prefersStatusBarHidden: Bool {
         return true
     }
     
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         for t in touches {
             ball = checkTouch(t)
//            backgroundImage.image = lamenArray
            UIView.animate(withDuration: 1.0) {
                self.backgroundImage.image = self.startLamen
            }

         }
     }
     
     override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         for t in touches {
             let location = t.location(in: self.view)
             
             if let snap = motionManager?.snap {
                 motionManager?.animator.removeBehavior(snap)
             }
             
             guard let b = ball else { return }
             motionManager?.snap = UISnapBehavior(item: b, snapTo: location)
             
             if let snap = motionManager?.snap {
                 motionManager?.animator.addBehavior(snap)
             }
         }
     }
     
     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
         for _ in touches {
             if let snap = motionManager?.snap {
                 motionManager?.animator.removeBehavior(snap)
                 motionManager?.snap = nil
                
                
             }
             ball = nil
         }
        
        UIView.animate(withDuration: 0.8, delay: 10, animations: {
            self.backgroundImage.image = self.lamenArray
        })
     
     }
     
     func checkTouch(_ touch: UITouch) -> CustomBall? {
        if ((ball?.frame.contains(touch.location(in: view))) != nil) {
                 return ball
             }
         
         return nil
     }
     
     func calculatePositions() -> [CGPoint] {
         guard let view = self.view else { return [] }
         
         let height = view.frame.height
         let width = view.frame.width
         
         var randomPositions = [CGPoint]()
         
             let randomX = CGFloat.random(in: 0 ..< width)
             let randomY = CGFloat.random(in: 0 ..< height)
             let p = CGPoint(x: randomX, y: randomY)
             randomPositions.append(p)
         
         
         return randomPositions
     }
     
     
     func createBall(position: CGPoint, color: UIColor) -> CustomBall {
        let ball = CustomBall(position: position, color: color, image: UIImage(named: "Frame 3")!)
         
         self.view.insertSubview(ball, at: 0)
         
         motionManager?.collider.addItem(ball)
         motionManager?.gravity.addItem(ball)
         
         return ball
     }
    
}
