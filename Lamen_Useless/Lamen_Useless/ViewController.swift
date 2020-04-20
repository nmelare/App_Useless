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
    
    @IBOutlet weak var bowlImage: UIImageView!
    
    let lamenArray = UIImage.animatedImageNamed("Comendo", duration: 0.8)
    
    var tap: UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
//         let tapLocation = gesture.location(in: backgroundImage.superview)
//        if ((backgroundImage.layer.presentation()?.frame.contains(tapLocation)) != nil) {
//
//        }
//    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard var lamenDuration = lamenArray?.duration else { return }
//        lamenDuration += 0.1
        backgroundImage.image = lamenArray
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
              
    }
    
}

