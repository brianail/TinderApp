//
//  Extension.swift
//  TinderApp
//
//  Created by Brian Ail on 21/05/22.
//

import Foundation
import UIKit

extension CombineVC {
    func adicionarCards() {
        for usuario in usuarios{
            let card = CombineCardView()
            card.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height * 0.7)
            card.center = view.center
            card.usuario = usuario
            card.tag = usuario.id
            
            card.callback = {(data) in
                self.visualizarDetalhe(usuario: data )
            }
            
            let gesture = UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(handlesCard))
            
            card.addGestureRecognizer(gesture)
            view.insertSubview(card, at: 1)
        }
    }
    
    func removerCard (card: UIView) {
        card.removeFromSuperview()
        self.usuarios = self.usuarios.filter({ (usuarios) -> Bool in
            return usuarios.id != card.tag
        })
    }
    
    func verificarMatch (usuarios: Usuario) {
        if usuarios.match{
            let matchVC = MatchVC()
            matchVC.usuario = usuarios
            matchVC.modalPresentationStyle = .fullScreen
            self.present(matchVC, animated: true, completion: nil)
        }
    }
    
    func visualizarDetalhe (usuario: Usuario) {
        let detalheVC = DetalheVC()
        detalheVC.usuario = usuario
        detalheVC.modalPresentationStyle = .fullScreen
        detalheVC.callback = { (usuario, acao) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if acao == .deslike {
                    self.deslikeClick()
                } else {
                    self.likeClick()
                }
            }
        }
        self.present(detalheVC, animated: true, completion: nil)
    }
    
    func adicionaHeader () {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        let top: CGFloat = window?.safeAreaInsets.top ?? 44
        
        let stackView = UIStackView(arrangedSubviews: [perfilButton,logoButton,chatButton])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.preencher(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil, padding: .init(top: top, left: 16, bottom: 0, right: 16))
        
        perfilButton.addTarget(self, action: #selector(perfilClique), for: .touchUpInside)
    }
    
    func adicionarFooter () {
        let stackView = UIStackView(arrangedSubviews: [UIView(), deslikeButton, superlikeButton, likeButton, UIView()])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.preencher(top: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, padding: .init(top: 0, left: 16, bottom: 34, right: 16))
        
        deslikeButton.addTarget(self, action: #selector(deslikeClick), for: .touchUpInside)
        superlikeButton.addTarget(self, action: #selector(superlikeClick), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(likeClick), for: .touchUpInside)
    }
    
    func visualizarUsuario () {
        let usuarioVC = UsuarioVC()
        usuarioVC.modalPresentationStyle = .fullScreen
        self.present(usuarioVC, animated: true, completion: nil)
    }
    
    @objc func handlesCard (gesture: UIPanGestureRecognizer) {
        if let card =  gesture.view as? CombineCardView {
            let point = gesture.translation(in: view)
            print(point)
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            let rotationAngle = point.x / view.bounds.width * 0.4
            if point.x > 0 {
                card.likeImageView.alpha = rotationAngle * 5
                card.deslikeImageView.alpha = 0
            } else {
                card.likeImageView.alpha = 0
                card.deslikeImageView.alpha = rotationAngle * 5 * -1
            }
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            if gesture.state == .ended {
                
                if card.center.x > self.view.bounds.width + 50{
                    self.animarCard(rotationAngle: rotationAngle, acao: .like)
                    return
                }
                
                if card.center.x < -50 {
                    self.animarCard(rotationAngle: rotationAngle, acao: .deslike)
                    return
                }
                
                UIView.animate(withDuration: 0.2) {
                    card.center = self.view.center
                    card.transform = .identity
                    
                    card.likeImageView.alpha = 0
                    card.deslikeImageView.alpha = 0
                }
            }
        }
    }
    
    func animarCard (rotationAngle: CGFloat, acao: Acao ) {
        if let usuario = self.usuarios.first {
            for view in self.view.subviews {
                if view.tag == usuario.id {
                    if let card = view as? CombineCardView {
                        let center: CGPoint
                        
                        var like: Bool
                        
                        switch acao {
                        case.deslike:
                            center = CGPoint(x: card.center.x - self.view.bounds.width, y: card.center.y + 50)
                            like = false
                        case.superlike:
                            center = CGPoint(x: card.center.x, y: card.center.y - self.view.bounds.height)
                            like = true
                        case.like:
                            center = CGPoint(x: card.center.x + self.view.bounds.width, y: card.center.y + 50)
                            like = true
                        }
                        
                        UIView.animate(withDuration: 0.4, animations: {
                            card.center = center
                            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
                            card.deslikeImageView.alpha = like == false ? 1 : 0
                            card.likeImageView.alpha = like == true ? 1 : 0
                        }) { _ in
                            
                            if like {
                                self.verificarMatch(usuarios: usuario)
                            }
                            self.removerCard(card: card)
                        }
                    }
                }
            }
        }
    }
    
    @objc func deslikeClick () {
        self.animarCard(rotationAngle: -0.4, acao: .deslike)
    }
    
    @objc func superlikeClick () {
        self.animarCard(rotationAngle: 0.4, acao: .superlike)
    }
    
    @objc func likeClick () {
        self.animarCard(rotationAngle: 0, acao: .like)
        
    }
    
    @objc func perfilClique () {
        visualizarUsuario()
    }
}
