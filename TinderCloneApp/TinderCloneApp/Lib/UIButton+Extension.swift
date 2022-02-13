//
//  UIButton+Extension.swift
//  TinderCloneApp
//
//  Created by Paolo Prodossimo Lopes on 07/10/21.
//

import UIKit

extension UIButton {
    static func FooterButton(named: String) -> UIButton {
        let button = UIButton()
        
        button.configureContantSize(width: 64, height: 64)
        button.setImage(UIImage(named: named), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 64/2
        button.clipsToBounds = true
        
        button.addShadow()
        
        return button
    }
    
    func addShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 2, height: 1)
    }
}
