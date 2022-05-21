//
//  UsuarioVc.swift
//  TinderApp
//
//  Created by Brian Ail on 20/05/22.
//

import UIKit

class UsuarioVC: UIViewController {
    
    var perfilButton: UIButton = .IconMenu(named: "icone-perfil")
    var logoButton: UIButton = .IconMenu(named: "icone-logo")
    var chatButton: UIButton = .IconMenu(named: "icone-chat")
    
    let fotoUsuario: UIImageView = .fotoImageView(named: "perfil")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.adicionaHeader()
        self.adicionarPerfil()
        
        logoButton.addTarget(self, action: #selector(voltarParaHome), for: .touchUpInside)
    }
}






