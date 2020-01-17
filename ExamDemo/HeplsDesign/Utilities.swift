//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.black.cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 0/255, green: 180/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 22.5
        button.tintColor = UIColor.darkText
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    
    static func styleHollowButton(_ button:UIButton) {
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 200/255, green: 0/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 22.5
        button.tintColor = UIColor.darkText
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        
    }
    static func selectButton(_ button:UIButton) {
        // Filled rounded corner style
        //button.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 200/255, alpha: 1)
        button.layer.cornerRadius = 20
        button.tintColor = UIColor.darkText
//        button.layer.shadowRadius = 5
//        button.layer.shadowOpacity = 0.7
//        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        
    }
    static func styleLabel(_ label:UILabel)
    {
           label.layer.cornerRadius = 20
           label.layer.borderColor = UIColor.systemGray.cgColor
           label.layer.borderWidth = 1
    }
    
}
