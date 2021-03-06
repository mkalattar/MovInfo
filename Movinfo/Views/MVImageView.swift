//
//  MVImageView.swift
//  Movinfo
//
//  Created by Mohamed Attar on 8/17/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

class MVImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        clipsToBounds        = true
        layer.cornerRadius   = 10
    }

}
