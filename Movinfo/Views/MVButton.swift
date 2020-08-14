//
//  MVButton.swift
//  Movinfo
//
//  Created by Mohamed Attar on 8/12/20.
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
    
    init(buttonLabel: String) {
        super.init(frame: .zero)
        setTitle(buttonLabel, for: .normal)
        configure()
    }
    
    private func configure() {
        backgroundColor      = .systemYellow
        layer.cornerRadius   = 20
        layer.maskedCorners  = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        titleLabel?.font     = UIFont.systemFont(ofSize: 20, weight: .medium)
        setTitleColor(.black, for: .normal)
              
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
