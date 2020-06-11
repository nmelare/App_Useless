//
//  CustomBall.swift
//  Lamen_Useless
//
//  Created by Nathalia Melare on 21/04/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//


import UIKit

class CustomBall: UIView {
    
    init(position: CGPoint, color: UIColor, image: UIImage) {
        super.init(frame: CGRect(x: position.x, y: position.y,width: 60, height: 60))

        self.layer.cornerRadius = self.frame.height/2
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
