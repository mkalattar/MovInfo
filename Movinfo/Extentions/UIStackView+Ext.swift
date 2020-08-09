//
//  UIStackView+Ext.swift
//  Movinfo
//
//  Created by Mohamed Attar on 8/9/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

extension UIStackView {
    
    // For debug purposes
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
