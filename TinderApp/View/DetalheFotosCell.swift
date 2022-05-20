//
//  DetalheFotosCell.swift
//  TinderApp
//
//  Created by Brian Ail on 15/05/22.
//

import UIKit

class DetalheFotosCell: UICollectionViewCell {
    
    let descricaoLabel: UILabel = .textBoldLabel(size: 16)
    
    let slideFotosVC = SlideFotosVc()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        descricaoLabel.text = "Fotos recentes Instagram"
        
        addSubview(descricaoLabel)
        descricaoLabel.preencher(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20)
        )
        
        addSubview(slideFotosVC.view)
        slideFotosVC.view.preencher(
            top: descricaoLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
