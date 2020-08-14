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
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(addTapped))
        view.backgroundColor    = .systemGray6
        getMovie()
    }
    
    @objc func addTapped(){
        
    }
    
    func configureDetailsButton() {
        view.addSubview(detailsButton)
        
        NSLayoutConstraint.activate([
            detailsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsButton.heightAnchor.constraint(equalToConstant: 100)
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
            movieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            movieImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImage.widthAnchor.constraint(equalToConstant: 367),
            movieImage.heightAnchor.constraint(equalToConstant: 550)
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
