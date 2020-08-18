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
    var genre           = ""
    var imdbRating      = ""
    var actors          = ""
    var awards          = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetailsButton()
        configureImage()
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
        movieImage.image        = thisImage
        movieImage.contentMode  = .scaleAspectFill
        // Constraints
        let padding: CGFloat = 20
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            movieImage.bottomAnchor.constraint(equalTo: detailsButton.topAnchor, constant: -padding)
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
                self.genre       = mov.genre
                self.imdbRating  = mov.imdbRating
                self.actors      = mov.actors
                self.awards      = mov.awards
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
        detailsVC.runtime.text          = "\(imdbRating) • \(runtime)"
        detailsVC.genre.text            = genre.replacingOccurrences(of: ",", with: " •")
        detailsVC.actors.text           = actors
        detailsVC.awards.text           = "Awards: \(awards)"
        
        present(detailsVC, animated: true, completion: nil)
    }
    
}
