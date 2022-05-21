//
//  CobineVC.swift
//  TinderApp
//
//  Created by Brian Ail on 14/05/22.
//

import UIKit

enum Acao {
    case deslike
    case superlike
    case like
}

class CombineVC: UIViewController {
    
    var perfilButton: UIButton = .IconMenu(named: "icone-perfil")
    var chatButton: UIButton = .IconMenu(named: "icone-chat")
    var logoButton: UIButton = .IconMenu(named: "icone-logo")
    var deslikeButton: UIButton  = .iconFooter(named: "icone-deslike")
    var superlikeButton: UIButton  = .iconFooter(named: "icone-superlike")
    var likeButton: UIButton  = .iconFooter(named: "icone-like")
    
    var usuarios: [Usuario] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loading = Loading(frame: view.frame)
        view.insertSubview(loading, at: 0)
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.white
        
        self.adicionaHeader()
        self.adicionarFooter()
        self.buscaUsuario()
    }
    
    func buscaUsuario () {
        UsuarioService.shared.buscaUsuarios {( usuarios, err) in
            if let usuarios = usuarios {
                DispatchQueue.main.async {
                    self.usuarios = usuarios
                    self.adicionarCards()
                }
            }
        }
    }
}

