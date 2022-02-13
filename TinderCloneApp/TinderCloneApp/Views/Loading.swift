//
//  Loading.swift
//  TinderCloneApp
//
//  Created by Paolo Prodossimo Lopes on 07/10/21.
//

import UIKit

final class Loading: UIView {
    
    //MARK: - Properties
    
    private let loadView: UIView = {
        let load = UIView()
        load.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        load.backgroundColor = UIColor(red: 218/255, green: 99/255, blue: 111/255, alpha: 1)
        load.layer.cornerRadius = 50
        load.layer.borderWidth = 1
        load.layer.borderColor = UIColor.red.cgColor
        return load
    }()
    
    let perfilImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        image.image = UIImage(named: "perfil")
        image.layer.cornerRadius = 80/2
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 5
        return image
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        [loadView, perfilImageView].forEach {
            addSubview($0)
            $0.center = center
        }
        
        animation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func animation() {
        
        self.loadView.center = CGPoint(x: super.frame.width/2, y: super.frame.height/2)
        
        UIView.animate(withDuration: 1.3) {
            self.loadView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
            self.loadView.layer.cornerRadius = 125
            self.loadView.center = CGPoint(x: super.frame.width/2, y: super.frame.height/2)
            self.loadView.alpha = 0.3
        } completion: { (_) in

            UIView.animate(withDuration: 0.3) {
                self.loadView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                self.loadView.layer.cornerRadius = 50
                self.loadView.center =  CGPoint(x: super.frame.width/2, y: super.frame.height/2)
                self.loadView.alpha = 1
                
            } completion: { (_) in
                
                self.animation()
            }

        }

    }
    
    //MARK: - Selectors
    
}
