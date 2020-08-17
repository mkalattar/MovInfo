//
//  DetailsViewController.swift
//  Movinfo
//
//  Created by Mohamed Attar on 8/13/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    let doneButton          = UIButton()
    let smallMovieImage     = MVImageView(frame: .zero)
    let movieName           = MVLabel()
    let movieReleaseDate    = MVLabel()
    let moviePlot           = MVLabel()
    let plotText            = MVLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureDoneButton()
        configureImage()
        configureMovieName()
        configureReleaseDate()
        configurePlotText()
        configurePlot()
    }

    
    
    func configureImage() {
        view.addSubview(smallMovieImage)
        smallMovieImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smallMovieImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            smallMovieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
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
    func configureMovieName() {
        view.addSubview(movieName)
        movieName.numberOfLines = 0
        movieName.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: smallMovieImage.topAnchor),
            movieName.leadingAnchor.constraint(equalTo: smallMovieImage.trailingAnchor, constant: 10),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    func configureReleaseDate() {
        view.addSubview(movieReleaseDate)
        movieReleaseDate.font       = UIFont.systemFont(ofSize: 20, weight: .medium)
        movieReleaseDate.textColor  = .systemGray
        
        NSLayoutConstraint.activate([
            movieReleaseDate.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 5),
            movieReleaseDate.leadingAnchor.constraint(equalTo: movieName.leadingAnchor),
            movieReleaseDate.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configurePlotText() {
        view.addSubview(plotText)
        plotText.text = "Plot"
        plotText.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        NSLayoutConstraint.activate([
            plotText.leadingAnchor.constraint(equalTo: smallMovieImage.leadingAnchor),
            plotText.topAnchor.constraint(equalTo: smallMovieImage.bottomAnchor, constant: 20),
        ])
    }
    
    func configurePlot() {
        view.addSubview(moviePlot)
        moviePlot.font          = UIFont.systemFont(ofSize: 20, weight: .medium)
        moviePlot.textColor     = .systemGray
        moviePlot.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            moviePlot.topAnchor.constraint(equalTo: plotText.bottomAnchor, constant: 10),
            moviePlot.leadingAnchor.constraint(equalTo: plotText.leadingAnchor),
            moviePlot.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}