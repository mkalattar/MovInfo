//
//  DetailsViewController.swift
//  Movinfo
//
//  Created by Mohamed Attar on 8/13/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    let doneButton      = UIButton()
    let smallMovieImage = MVImageView(frame: .zero)
    var movieName       = MVLabel()
    var movieYear       = MVLabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureDoneButton()
        configureImage()
    }

    
    
    func configureImage() {
        view.addSubview(smallMovieImage)
        smallMovieImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smallMovieImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            smallMovieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            smallMovieImage.heightAnchor.constraint(equalToConstant: 250),
            smallMovieImage.widthAnchor.constraint(equalToConstant: 167)
        ])
    }
    
    func configureDoneButton() {
        view.addSubview(doneButton)
        doneButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.systemYellow, for: .normal)
        
        // Constraint
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            doneButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
        ])
    }
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}
