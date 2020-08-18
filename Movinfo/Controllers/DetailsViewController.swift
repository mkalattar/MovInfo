//
//  DetailsViewController.swift
//  Movinfo
//
//  Created by Mohamed Attar on 8/13/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    let doneButton              = UIButton()
    let smallMovieImage         = MVImageView(frame: .zero)
    let movieName               = MVLabel()
    let movieReleaseDate        = MVLabel()
    let moviePlot               = MVLabel()
    let plotText                = MVLabel()
    let rated                   = MVLabel()
    let runtime                 = MVLabel()
    let genre                   = MVLabel()
    let actors                  = MVLabel()
    let actorsText              = MVLabel()
    let scrollV                 = UIScrollView(frame: .zero)
    let containerView           = UIView()
    
    lazy var contentViewSize    = CGSize(width: view.frame.width, height: view.frame.height + 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureScrollView()
        configureContainerView()
        configureDoneButton()
        configureImage()
        configureMovieName()
        configureReleaseDate()
        configureActorsText()
        configureActors()
        configurePlotText()
        configurePlot()
        configureRating()
        configureRuntime()
        configureGenreLabel()
        
        // configureImdbRating()
    }
    
    func configureScrollView() {
        view.addSubview(scrollV)
        
        scrollV.backgroundColor     = .systemBackground
        scrollV.frame               = self.view.bounds
        scrollV.contentSize         = contentViewSize
        scrollV.autoresizingMask    = .flexibleHeight
        scrollV.bounces             = true
    }
    
    func configureContainerView() {
        scrollV.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.frame.size      = contentViewSize
    }
    
    func configureImage() {
        containerView.addSubview(smallMovieImage)
        
        smallMovieImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smallMovieImage.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            smallMovieImage.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 70),
            smallMovieImage.heightAnchor.constraint(equalToConstant: 250),
            smallMovieImage.widthAnchor.constraint(equalToConstant: 167)
        ])
    }
    
    func configureDoneButton() {
        view.addSubview(doneButton)
        doneButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.systemYellow, for: .normal)
        doneButton.layer.cornerRadius = 10
        doneButton.backgroundColor    = .systemBackground
        
        // Constraint
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            doneButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
        ])
    }
    func configureMovieName() {
        containerView.addSubview(movieName)
        movieName.numberOfLines = 0
        movieName.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: smallMovieImage.topAnchor),
            movieName.leadingAnchor.constraint(equalTo: smallMovieImage.trailingAnchor, constant: 10),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    func configureReleaseDate() {
        containerView.addSubview(movieReleaseDate)
        movieReleaseDate.font       = UIFont.systemFont(ofSize: 20, weight: .medium)
        movieReleaseDate.textColor  = .systemGray
        
        NSLayoutConstraint.activate([
            movieReleaseDate.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 10),
            movieReleaseDate.leadingAnchor.constraint(equalTo: movieName.leadingAnchor),
            movieReleaseDate.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configurePlotText() {
        containerView.addSubview(plotText)
        plotText.text = "Plot"
        plotText.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        NSLayoutConstraint.activate([
            plotText.leadingAnchor.constraint(equalTo: actorsText.leadingAnchor),
            plotText.topAnchor.constraint(equalTo: actors.bottomAnchor, constant: 20),
        ])
    }
    
    func configurePlot() {
        containerView.addSubview(moviePlot)
        moviePlot.font          = UIFont.systemFont(ofSize: 20, weight: .medium)
        moviePlot.textColor     = .systemGray
        moviePlot.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            moviePlot.topAnchor.constraint(equalTo: plotText.bottomAnchor, constant: 10),
            moviePlot.leadingAnchor.constraint(equalTo: plotText.leadingAnchor),
            moviePlot.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func configureRating() {
        containerView.addSubview(rated)
        rated.font              = UIFont.systemFont(ofSize: 15, weight: .medium)
        rated.layer.borderWidth = 1
        rated.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1).cgColor
        rated.textAlignment     = .center
        
        NSLayoutConstraint.activate([
            rated.centerXAnchor.constraint(equalTo: smallMovieImage.centerXAnchor),
            rated.bottomAnchor.constraint(equalTo: smallMovieImage.topAnchor, constant: -10),
            rated.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureRuntime() {
        containerView.addSubview(runtime)
        runtime.font       = UIFont.systemFont(ofSize: 20, weight: .medium)
        runtime.textColor  = .systemGray
        
        NSLayoutConstraint.activate([
            runtime.leadingAnchor.constraint(equalTo: movieReleaseDate.leadingAnchor),
            runtime.topAnchor.constraint(equalTo: movieReleaseDate.bottomAnchor, constant: 3)
        ])
    }
    
    func configureGenreLabel() {
        containerView.addSubview(genre)
        genre.font          = UIFont.systemFont(ofSize: 20, weight: .medium)
        genre.textColor     = .systemGray
        genre.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            genre.leadingAnchor.constraint(equalTo: movieReleaseDate.leadingAnchor),
            genre.topAnchor.constraint(equalTo: runtime.bottomAnchor, constant: 3),
            genre.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureActorsText() {
        containerView.addSubview(actorsText)
        actorsText.text = "Actors"
        actorsText.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        NSLayoutConstraint.activate([
            actorsText.leadingAnchor.constraint(equalTo: smallMovieImage.leadingAnchor),
            actorsText.topAnchor.constraint(equalTo: smallMovieImage.bottomAnchor, constant: 20),
        ])
    }
    
    func configureActors() {
        containerView.addSubview(actors)
        actors.font          = UIFont.systemFont(ofSize: 20, weight: .medium)
        actors.textColor     = .systemGray
        actors.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            actors.topAnchor.constraint(equalTo: actorsText.bottomAnchor, constant: 10),
            actors.leadingAnchor.constraint(equalTo: actorsText.leadingAnchor),
            actors.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    //    func configureImdbRating() {
    //        view.addSubview(imdbRating)
    //        imdbRating.font          = UIFont.systemFont(ofSize: 21, weight: .medium)
    //        imdbRating.textColor     = .systemGray
    //
    //        NSLayoutConstraint.activate([
    //
    //        ])
    //    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}
