//
//  UIBarButtonItem.swift
//  TinderCloneApp
//
//  Created by Paolo Prodossimo Lopes on 07/10/21.
//

import UIKit

extension UIBarButtonItem {
    static func configureButton(_ named: String, action: Selector, isRight: Bool) -> UIBarButtonItem {
        let imageView = UIImageView(image: UIImage(named: named))
        imageView.configureContantSize(width: 36, height: 36)
        let button: UIBarButtonItem = .init(customView: imageView)
        button.action = action
        return button
    }
    
}
