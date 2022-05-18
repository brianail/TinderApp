//
//  SlideFotoCell.swift
//  TinderApp
//
//  Created by Brian Ail on 17/05/22.
//

import UIKit

class SlideFotoCell: UICollectionViewCell {
    
    var fotoImageView: UIImageView = .fotoImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius =  8
        clipsToBounds = true
        
        addSubview(fotoImageView)
        fotoImageView.preencherSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    
}
