//
//  MVLabel.swift
//  Movinfo
//
//  Created by Mohamed Attar on 8/9/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

class MVLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        font        = .preferredFont(forTextStyle: .title3)
        textColor   = .label
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
