//
//  CustomUIViewsProtocol.swift
//  TinderCloneApp
//
//  Created by Paolo Prodossimo Lopes on 07/10/21.
//

import UIKit

typealias CustomViewProtocol = (UIView & CustomUIProtocol)

protocol CustomUIProtocol {
    func configureHierarchy()
    func configureConstraints()
    func configureStyle()
}

extension CustomUIProtocol {
    func configureStyle() {}
    
    func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
}
