//
//  ExtensionUsuarioVC.swift
//  TinderApp
//
//  Created by Brian Ail on 21/05/22.
//

import Foundation
import UIKit

extension UsuarioVC {
    func adicionaHeader () {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        let top: CGFloat = window?.safeAreaInsets.top ?? 44
        
        let stackView = UIStackView(arrangedSubviews: [perfilButton,logoButton,chatButton])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.preencher(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil, padding: .init(top: top, left: 16, bottom: 0, right: 16))
    }
    
    func visualizarHome () {
        let combineVC = CombineVC()
        combineVC.modalPresentationStyle = .fullScreen
        self.present(combineVC, animated: false, completion: nil)
    }
    
    func adicionarPerfil() {
        let perfilUsuario = DetalhePerfilView()
        perfilUsuario.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height * 0.7)
        perfilUsuario.center = view.center
    }
    
    @objc func voltarParaHome () {
        visualizarHome()
    }
}

