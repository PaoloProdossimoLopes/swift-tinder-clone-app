//
//  UIView+Extensions.swift
//  TinderCloneApp
//
//  Created by Paolo Prodossimo Lopes on 06/10/21.
//

import UIKit

extension UIView {
    
    /// Funçao customizada para settar as contraints + padding
    func configureConstraints(leading: NSLayoutXAxisAnchor? = nil, top: NSLayoutYAxisAnchor? = nil,
                          trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil,
                          padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let leading = leading { self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true }
        if let top = top { self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true }
        if let trailing = trailing { self.trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true }
        if let bottom = bottom { self.bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true }
    }
    
    /// Funçao customizada para prencher a view em relaçao a view PAI
    func fillSuperView() {
        configureConstraints(leading: superview?.leadingAnchor, top: superview?.topAnchor,
                             trailing: superview?.trailingAnchor, bottom: superview?.bottomAnchor)
    }
    
    /// Funçao customizada para configurar o tamanho da view
    func configureContantSize(width: CGFloat? = nil, height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centralizeView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
    }
    
    func centralizeViewX() {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
    }
}
