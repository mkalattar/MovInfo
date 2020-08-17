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
    let thisImage       = UIImage(named: "MVPlaceholder")
    let movieImage      = MVImageView(frame: .zero)
    var plot            = ""
    var releaseDate     = ""
    var name            = ""
    var rated           = ""
    var runtime         = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImage()
        configureDetailsButton()
        getMovie()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getMovie()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(addTapped))
        view.backgroundColor    = .systemGray6
        
    }
    
    @objc func addTapped(){
        // set up activity view controller
        let imageToShare            = [ movieImage.image! ]
        let activityViewController  = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)

        // present the view controller
        self.present(activityViewController, animated: true)
    }
    
    func configureDetailsButton() {
        view.addSubview(detailsButton)
        detailsButton.addTarget(self, action: #selector(goToDetailsVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            detailsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    func configureImage() {
        view.addSubview(movieImage)
        movieImage.image = thisImage
        
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
                self.plot        = mov.plot
                self.name        = mov.title
                self.rated       = mov.rated
                self.releaseDate = mov.released
                self.runtime     = mov.runtime
                let url = URL(string: mov.poster)!
                DispatchQueue.main.async {
                    self.movieImage.load(url: url)
                }
            case .failure(_):
                self.presentAlertVCOnMainThread(title: "Oops!", message: "Couldn't find movie. Please try again.")
                
            }
        }
    }
    
    @objc func goToDetailsVC() {
        let detailsVC = DetailsViewController()
        
        detailsVC.smallMovieImage.image = movieImage.image
        detailsVC.movieName.text        = name
        detailsVC.movieReleaseDate.text = releaseDate
        detailsVC.moviePlot.text        = plot
        detailsVC.rated.text            = rated
        detailsVC.runtime.text          = runtime
        
        present(detailsVC, animated: true, completion: nil)
    }
    
}
