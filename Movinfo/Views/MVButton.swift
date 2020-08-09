//
//  MVButton.swift
//  Movinfo
//
//  Created by Mohamed Attar on 8/9/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

class MVButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 47, weight: .light, scale: .small)
        setImage(UIImage(systemName: "arrow.right.circle.fill", withConfiguration: largeConfig), for: .normal)
        tintColor = .systemGray
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
