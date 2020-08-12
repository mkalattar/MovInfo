//
//  UIImageView+Ext.swift
//  Movinfo
//
//  Created by Mohamed Attar on 8/12/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
