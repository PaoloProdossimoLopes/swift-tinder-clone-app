//
//  UILabel+Extensions.swift
//  TinderCloneApp
//
//  Created by Paolo Prodossimo Lopes on 07/10/21.
//

import UIKit

extension UILabel {
    
    //MARK: - Statics
    
    static func TinderBoldText(size: CGFloat, txColor: UIColor, numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: size)
        label.textColor = txColor
        label.numberOfLines = numberOfLines
        return label
    }
    
    static func TinderLightText(size: CGFloat, txColor: UIColor, numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: size)
        label.textColor = txColor
        label.numberOfLines = numberOfLines
        return label
    }
    
    //MARK: - Regulars
    
    func addShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 2, height: 1)
    }
}

