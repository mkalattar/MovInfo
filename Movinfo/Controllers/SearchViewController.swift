//
//  SearchViewController.swift
//  Movinfo
//
//  Created by Mohamed Attar on 7/25/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit



class SearchViewController: UIViewController, UITextFieldDelegate {


    static let items = ["Movie", "TV Show"]

    let searchMovieTextField    = MVTextField(placeholderText: "e.g. Star Wars", keyboardType: .alphabet)
    let yearTextField           = MVTextField(placeholderText: "e.g. 1974", keyboardType: .numberPad)
    let searchButton            = MVGoButton()
    let movieNameLabel          = MVLabel()
    let yearLabel               = MVLabel()
    let chooseTypeSegment       = UISegmentedControl(items: items)
    let detailsStackView        = UIStackView()
    
    var isMovieNameEntered:Bool {
        return !searchMovieTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createDismissKeyboardTapGesture()
        configureDetailsStackView()
        createButton()
        view.backgroundColor = .systemGray6
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    func configureDetailsStackView(){
        view.addSubview(detailsStackView)
        detailsStackView.axis           = .vertical
        detailsStackView.alignment      = .leading
        detailsStackView.spacing        = 10
        
        // Constraints
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            detailsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            detailsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
        
        // Creating elements
        createMovieNameLabel()
        createSearchTextField()
    }
    
    
    func createSearchTextField() {
        detailsStackView.addArrangedSubview(searchMovieTextField)
        searchMovieTextField.delegate = self
        
        // Constraints
        NSLayoutConstraint.activate([
            searchMovieTextField.heightAnchor.constraint(equalToConstant: 45),
            searchMovieTextField.trailingAnchor.constraint(equalTo: detailsStackView.trailingAnchor)
        ])
        
    }
    
    func createYearTextField() {
        view.addSubview(yearTextField)
        yearTextField.delegate        = self
        // Constraints
        NSLayoutConstraint.activate([
            yearTextField.heightAnchor.constraint(equalToConstant: 45),
            yearTextField.trailingAnchor.constraint(equalTo: detailsStackView.trailingAnchor, constant: -50)
        ])
    }
    
    
    func createChooseTypeSegment() {
        view.addSubview(chooseTypeSegment)
        chooseTypeSegment.selectedSegmentIndex = 0
        chooseTypeSegment.backgroundColor = .systemFill
        chooseTypeSegment.selectedSegmentTintColor = .systemGray
       
        // Constraints
        chooseTypeSegment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chooseTypeSegment.trailingAnchor.constraint(equalTo: detailsStackView.trailingAnchor, constant: -50)
        ])
    }
    
    
    func createMovieNameLabel() {
        detailsStackView.addArrangedSubview(movieNameLabel)
        movieNameLabel.text = "Movie Name:"
    }
    
    func createYearLabel() {
        view.addSubview(yearLabel)
        yearLabel.text = "(Optional) Year:"
    }
    
    func createButton() {
        view.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        // Constraints
        NSLayoutConstraint.activate([
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: detailsStackView.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func buttonPressed() {
        
        guard isMovieNameEntered else {
            presentAlertVCOnMainThread(title: "Empty Movie name", message: "Please write a movie name.")
            return
        }
        
        let movieVC = MovieViewController()
        let movieNameWithSpaces = searchMovieTextField.text!
        let movieNameWithoutSpaces = movieNameWithSpaces.replacingOccurrences(of: " ", with: "+")
        movieVC.movieName = movieNameWithoutSpaces
        MovInfoManager.shared.fetchMovieData(for: movieNameWithoutSpaces) { result in
            switch result {
            case .success(let mov):
                DispatchQueue.main.async {
                    movieVC.title = "\(mov.title) \(mov.year)"
                    self.navigationController?.pushViewController(movieVC, animated: true)
                }
                
            case .failure(_):
                self.presentAlertVCOnMainThread(title: "Oops!", message: "Couldn't find movie. Please try again.")
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buttonPressed()
        textField.endEditing(true)
        return true
    }
    
    

}
