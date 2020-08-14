//
//  MVButton.swift
//  Movinfo
//
//  Created by Mohamed Attar on 8/9/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

class MVsfButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(shape: String) {
        super.init(frame: .zero)
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 35, weight: .light, scale: .default)
        setImage(UIImage(systemName: shape, withConfiguration: largeConfig), for: .normal)
        configure()
    }
    
    
    private func configure() {
        tintColor           = .systemYellow
        layer.cornerRadius  = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
