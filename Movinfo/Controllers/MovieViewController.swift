//
//  MovieViewController.swift
//  Movinfo
//
//  Created by Mohamed Attar on 7/25/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movieName:String!
    
    let downloadButton  = UIButton()
    let detailsButton   = MVButton(buttonLabel: "Details")
    let image           = UIImage(named: "MVPlaceholder")
    let movieImage      = UIImageView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImage()
        configureDetailsButton()
        getMovie()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor    = .systemGray6
        getMovie()
    }
    
    func configureDetailsButton() {
        view.addSubview(detailsButton)
        
        NSLayoutConstraint.activate([
            detailsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsButton.centerYAnchor.constraint(equalTo: movieImage.bottomAnchor),
            detailsButton.leadingAnchor.constraint(equalTo: movieImage.leadingAnchor, constant: 20),
            detailsButton.trailingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: -20),
            detailsButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureImage() {
        view.addSubview(movieImage)
        movieImage.image                = image
        movieImage.clipsToBounds        = true
        movieImage.layer.cornerRadius   = 10
        
        // Constraints
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            movieImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func getMovie() {
        MovInfoManager.shared.fetchMovieData(for: movieName) { result in
            switch result {
            case .success(let mov):
                let url = URL(string: mov.poster)!
                DispatchQueue.main.async {
                    self.movieImage.load(url: url)
                }
            case .failure(_):
                self.presentAlertVCOnMainThread(title: "Oops!", message: "Couldn't find movie. Please try again.")
                
            }
        }
    }
    
}
