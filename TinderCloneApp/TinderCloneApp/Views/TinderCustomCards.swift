//
//  TinderCustomCards.swift
//  TinderCloneApp
//
//  Created by Paolo Prodossimo Lopes on 07/10/21.
//

import UIKit

enum Action {
    case like
    case deslike
    case superLike
}

protocol TinderCustomCardsDelegate: AnyObject {
    func cardSwipeHandle(_ gesture: UIPanGestureRecognizer, view: UIView)
    func stackViewTap(_ otherUser: OtherUser)
}

final class TinderCustomCards: CustomViewProtocol {
    
    //MARK: - Properties
    
    weak var delegate: TinderCustomCardsDelegate?
    
    var otherUser: OtherUser? {
        didSet { inputData() }
    }
    
    private let photoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        image.clipsToBounds = true
        image.layer.borderWidth = 0.3
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.cornerRadius = 8
        return image
    }()
    
    private let nameLabel: UILabel = .TinderBoldText(size: 30, txColor: .white)
    private let phraseLabel: UILabel = .TinderLightText(size: 22, txColor: .white)
    
    private let VStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()
    
    //MARK: - Lifecycle
    
    init() {
        super.init(frame: .zero)
        commonInit()
        
        let gesture = UIPanGestureRecognizer()
        gesture.addTarget(self, action: #selector(cardSwipeHandle))
        addGestureRecognizer(gesture)
        isUserInteractionEnabled = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureHierarchy() {
        [nameLabel, phraseLabel].forEach { VStack.addArrangedSubview($0) }
        [photoImageView, VStack].forEach { addSubview($0) }
    }
    
    func configureConstraints() {
        photoImageView.fillSuperView()
        VStack.configureConstraints(
            leading: leadingAnchor,
            trailing: trailingAnchor ,
            bottom: bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: 16, right: 16)
        )
    }
    
    func configureStyle() {
        [nameLabel, phraseLabel].forEach { $0.addShadow() }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(stackViewTap))
        VStack.isUserInteractionEnabled = true
        VStack.addGestureRecognizer(tap)
    }
    
    private func inputData() {
        guard let oUser = otherUser else { return }
        
        let nameAndAge = "\(oUser.name), \(oUser.age)"
        nameLabel.text = nameAndAge
        phraseLabel.text = oUser.phase
        photoImageView.image = UIImage(named: oUser.photo)
    }
    
    private func animateCardView(_ gesture: UIPanGestureRecognizer, card: UIView) {
        if let card = gesture.view {
            guard let superview = superview else { return }
            let point = gesture.translation(in: superview),
                // isso rerna as cordenadas da tela a cada comomento que se mexe o obj
                x = superview.center.x + point.x,
                // move o objeto para a posiçao correta de a cordo com o mov em X
                y =  superview.center.y + point.y // move o objeto para a posiçao correta de a cordo com o mov em Y
            
            let cardAngleRotation = (point.x / superview.bounds.width) * 0.4
            card.transform = CGAffineTransform(rotationAngle: cardAngleRotation)
            
            card.center = CGPoint(x: x, y: y)
            
            if gesture.state == .ended {
                
                if card.center.x > (super.bounds.width + 30) {
                    animateRemoveCard(card, rotation: cardAngleRotation, action: .like)
                } else if card.center.x < -30 {
                    animateRemoveCard(card, rotation: cardAngleRotation, action: .deslike)
                } else {
                    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: .curveEaseInOut, animations: {
                        card.center = superview.center // volta o card para o centro
                        card.transform = .identity // faz o card voltar a rotaçao original
                    })
                }
            }
        }
    }
    
    func removeCard(card: UIView) {
        card.removeFromSuperview()
    }
    
    func animateRemoveCard(_ card: UIView, rotation: CGFloat, action: Action) {
        let center: CGPoint
        guard let superview = superview else { return }
        
        switch action {
        case .like:
            center = CGPoint(x: card.center.x + superview.bounds.width, y: card.center.y + 50)
        case .deslike:
            center = CGPoint(x: card.center.x - superview.bounds.width, y: card.center.y + 50)
        case .superLike:
            center = CGPoint(x: card.center.x, y: card.center.x + superview.bounds.height)
        }
        
        UIView.animate(withDuration: 0.2) {
            card.center = center
            card.transform = CGAffineTransform(rotationAngle: rotation)
        } completion: { [weak self] (_) in
            self?.removeCard(card: card)
        }

    }
    
    //MARK: - Selectors
    
    @objc private func cardSwipeHandle(_ gesture: UIPanGestureRecognizer, view: UIView) {
        animateCardView(gesture, card: view)
        delegate?.cardSwipeHandle(gesture, view: view)
    }
    
    @objc private func stackViewTap() {
        guard let oUser = otherUser else { return }
        delegate?.stackViewTap(oUser)
    }
    
}
