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
    
    var lamenArray = UIImage.animatedImageNamed("Comendo", duration: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.image = lamenArray
    }
}

