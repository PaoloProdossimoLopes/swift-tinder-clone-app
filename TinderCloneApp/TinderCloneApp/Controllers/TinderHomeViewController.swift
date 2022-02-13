//
//  ViewController.swift
//  TinderCloneApp
//
//  Created by Paolo Prodossimo Lopes on 06/10/21.
//

import UIKit

class TinderHomeViewController: UIViewController {
    
    //MARK: - Properties
    private let loadingView = Loading()
    private var otherUsers: [OtherUser] = [OtherUser]()
    
    private let deslikeButton: UIButton = .FooterButton(named: "icone-deslike")
    private let likeButton: UIButton = .FooterButton(named: "icone-like")
    private let suprelikeButton: UIButton = .FooterButton(named: "icone-superlike")
    
    private lazy var perfilButton: UIBarButtonItem = .configureButton(
        "icone-perfil", action:  #selector(perfilButotnTapped), isRight: true
    )
    
    private lazy var chatButton: UIBarButtonItem = .configureButton(
        "icone-chat", action: #selector(chatButtonTapped), isRight: false
    )
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loadingView)
        loadingView.centralizeView()
        
        configureNavBar()
        fetchOtherUsers()
    }
    
    //MARK: - Helpers
    
    private func configureNavBar() {
        view.backgroundColor = .white
        contigureNavigationTinderStyle()
        
        navigationItem.rightBarButtonItem = perfilButton
        navigationItem.leftBarButtonItem = chatButton
    }
    
    private func fetchOtherUsers() {
        OtherUserService.shared.fetchOtherUser(completion: { [weak self] oUsers, error in
            guard let oUsers = oUsers, let self = self else { return }
            
            DispatchQueue.main.async {
                oUsers.forEach { (user) in self.otherUsers.append(user) }
                
                self.configureCardView()
                self.configureButton()
                
                self.loadingView.removeFromSuperview()
            }
        })
    }
    
    private func configureCardView() {
        for oUser in otherUsers.reversed() {
            let carView = TinderCustomCards()
            
            carView.delegate = self
            carView.otherUser = oUser
            carView.tag = oUser.id
            
            //Setup in view
            view.addSubview(carView)
            carView.configureContantSize(
                width: view.bounds.width - 32,
                height: view.bounds.height * 0.7
            )
            carView.centralizeView()
        }
    }
    
    private func configureButton() {
        let stackButtons = UIStackView(arrangedSubviews: [deslikeButton, suprelikeButton, likeButton])
        stackButtons.distribution = .equalCentering
        stackButtons.spacing = 30
        stackButtons.axis = .horizontal
        
        view.addSubview(stackButtons)
        stackButtons.configureConstraints(
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            padding: UIEdgeInsets.init(top: 0, left: 0, bottom: 16, right: 0)
        )
        stackButtons.centralizeViewX()
        
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        suprelikeButton.addTarget(self, action: #selector(superLikeButtonTapped), for: .touchUpInside)
        deslikeButton.addTarget(self, action: #selector(deslikeButtonTapped), for: .touchUpInside)
        
    }
    
    private func removeCard(card: UIView) {
        card.removeFromSuperview()
    }
    
    private func animateRemoveCard(rotation: CGFloat, action: Action) {
        
        if let userCurrent = self.otherUsers.first {
            for view in self.view.subviews {
                if view.tag == userCurrent.id {
                    if let card = view as? TinderCustomCards {
                        
                        let center: CGPoint
                        var like: Bool = false
                        
                        switch action {
                        case .like:
                            center = CGPoint(x: card.center.x + view.bounds.width, y: card.center.y + 50)
                            like = true
                        case .deslike:
                            center = CGPoint(x: card.center.x - view.bounds.width, y: card.center.y + 50)
                            like = false
                        case .superLike:
                            center = CGPoint(x: card.center.x, y: card.center.x - view.bounds.height)
                        }
                        
                        UIView.animate(withDuration: 0.3) {
                            card.center = center
                            card.transform = CGAffineTransform(rotationAngle: rotation)
                        } completion: { [weak self] (_) in
                            if like {
                                self?.verifyMatch(oUser: userCurrent)
                            }
                            
                            self?.removeCard(card: card)
                            self?.otherUsers.removeFirst()
                        }
                    }
                }
            }
        }
    }
    
    private func verifyMatch(oUser: OtherUser) {
        if oUser.match {
            print("Deu match")
        }
    }
    
    private func showDetails(_ oUser: OtherUser) {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        present(vc, animated: true, completion: nil)
    }
    
    //MARK: - Selectors
    
    @objc private func perfilButotnTapped() {
        
    }
    
    @objc private func chatButtonTapped() {
        
    }
    
    @objc private func likeButtonTapped() {
        animateRemoveCard(rotation: 0.4, action: .like)
    }
    
    @objc private func superLikeButtonTapped() {
        animateRemoveCard(rotation: 0, action: .superLike)
    }
    
    @objc private func deslikeButtonTapped() {
        animateRemoveCard(rotation: -0.4, action: .deslike)
    }
    
}

extension TinderHomeViewController: TinderCustomCardsDelegate {
    func stackViewTap(_ otherUser: OtherUser) {
        showDetails(otherUser)
    }
    
    func cardSwipeHandle(_ gesture: UIPanGestureRecognizer, view: UIView) { }
}

