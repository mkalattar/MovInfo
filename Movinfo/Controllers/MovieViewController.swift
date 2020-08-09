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
    let detailsButton   = UIButton()
    let movieImage      = UIImage(named: "")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovie()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor    = .systemGray6
        getMovie()
    }
    
    func getMovie() {
        MovInfoManager.shared.fetchMovieData(for: movieName) { result in
            switch result {
            case .success(let mov):
                DispatchQueue.main.async {
                    self.title = "\(mov.title) \(mov.year)"
                }
            case .failure(_):
                self.presentAlertVCOnMainThread(title: "Oops!", message: "Couldn't find movie. Please try again.")
                
            }
        }
    }
    
}
