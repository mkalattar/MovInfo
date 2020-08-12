//
//  MVTextField.swift
//  Movinfo
//
//  Created by Mohamed Attar on 8/9/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

class MVTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholderText: String, keyboardType: UIKeyboardType) {
        super.init(frame: .zero)
        self.placeholder    = placeholderText
        self.keyboardType   = keyboardType
        configure()
    }
    
    private func configure() {
        layer.cornerRadius     = 10
        textAlignment          = .center
        backgroundColor        = .systemFill
        clearButtonMode        = .always
        autocapitalizationType = .words
        tintColor              = .systemYellow
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
