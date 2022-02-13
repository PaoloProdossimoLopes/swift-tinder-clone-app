//
//  UIViewController+Extensions.swift
//  TinderCloneApp
//
//  Created by Paolo Prodossimo Lopes on 07/10/21.
//

import UIKit

extension UIViewController {
    func contigureNavigationTinderStyle() {
        
        guard let nav = navigationController else { return }
        
        let logo = UIImageView(image: UIImage(named: "icone-logo"))
        let size = nav.navigationBar.frame.height - 10
        logo.configureContantSize(width: size, height: size)
        
        nav.navigationBar.barStyle = .default
        navigationItem.titleView = logo
        
        setTransparent()
        
        view.backgroundColor = .TINDER_BACKGROUND_VIEW
    }
    
    func setTransparent() {
        guard let nav = navigationController else { return }
        
        nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.0)
    }
}
