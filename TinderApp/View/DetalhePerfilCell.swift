//
//  DetalhePerfilCell.swift
//  TinderApp
//
//  Created by Brian Ail on 15/05/22.
//

import UIKit

class DetalhePerfilCell: UICollectionViewCell {
    
  var usuario: Usuario? {
    didSet {
      if let usuario = usuario {
        nomeLabel.text = usuario.nome
        idadeLabel.text = String(usuario.idade)
        fraseLabel.text = usuario.frase
      }
    }
  }

    let nomeLabel: UILabel = .textBoldLabel(size: 32)
    let idadeLabel: UILabel = .textLabel(size: 28)
    let fraseLabel: UILabel = .textLabel(size: 18, numberOfLines: 0)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
        
    let nomeIdadeStackView = UIStackView(arrangedSubviews: [nomeLabel, idadeLabel, UIView()])
    nomeIdadeStackView.spacing = 12
    
    let stackView = UIStackView(arrangedSubviews: [nomeIdadeStackView, fraseLabel])
    stackView.distribution = .fillEqually
    stackView.axis = .vertical
    
    addSubview(stackView)
    stackView.preencherSuperview(padding: .init(
      top: 20,
      left: 20,
      bottom: 20,
      right: 20
    ))
    
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}

