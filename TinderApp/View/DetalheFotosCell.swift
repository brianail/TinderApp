//
//  DetalheFotosCell.swift
//  TinderApp
//
//  Created by Brian Ail on 15/05/22.
//

import UIKit

class DetalheFotosCell: UICollectionViewCell {
    
    let descricaoLabel: UILabel = .textBoldLabel(size: 16)
    
    let slidefotosVC = SlideFotosVc()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        descricaoLabel.text = "Fotos recentes instagram"
        
        addSubview(descricaoLabel)
        descricaoLabel.preencher(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        addSubview(slidefotosVC.view)
        slidefotosVC.view.preencher(top: descricaoLabel.topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
