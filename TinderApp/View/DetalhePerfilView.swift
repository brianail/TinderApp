//
//  DetalhePerfilView.swift
//  TinderApp
//
//  Created by Brian Ail on 21/05/22.
//

import UIKit

class DetalhePerfilView: UIView {
    
    let fotoImageView: UIImageView = .fotoImageView()
    let nomeLabel: UILabel = .textBoldLabel(size: 32, textColor: .white)
    let idadeLabel: UILabel = .textLabel(size: 28, textColor: .white)
    let fraseLabel: UILabel = .textLabel(size: 18, textColor: .white, numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

