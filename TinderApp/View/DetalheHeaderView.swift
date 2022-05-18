//
//  DetalheHeaderView.swift
//  TinderApp
//
//  Created by Brian Ail on 15/05/22.
//

import UIKit

class DetalheHeaderView: UICollectionReusableView {
    
    var usuario: Usuario? {
        didSet{
            fotoImageview.image = UIImage(named: usuario!.foto)
        }
    }
    
    var fotoImageview: UIImageView = .fotoImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(fotoImageview)
        fotoImageview.preencherSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
