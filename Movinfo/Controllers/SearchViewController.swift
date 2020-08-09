//
//  SearchViewController.swift
//  Movinfo
//
//  Created by Mohamed Attar on 7/25/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit



class SearchViewController: UIViewController, UITextFieldDelegate {
    
    var movInfoManager = MovInfoManager()
    static let items = ["Movie", "TV Show"]

    let searchMovieTextField    = MVTextField(placeholderText: "e.g. Star Wars", keyboardType: .alphabet)
    let yearTextField           = MVTextField(placeholderText: "e.g. 1974", keyboardType: .numberPad)
    let searchButton            = MVButton()
    let movieNameLabel          = MVLabel()
    let yearLabel               = MVLabel()
    let chooseTypeSegment       = UISegmentedControl(items: items)
    let detailsStackView        = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetailsStackView()
        createButton()
        view.backgroundColor = .systemGray6
    }
    
    
    func configureDetailsStackView(){
        view.addSubview(detailsStackView)
        detailsStackView.axis           = .vertical
        detailsStackView.alignment      = .leading
        detailsStackView.spacing        = 10
        
        // Creating elements
        createMovieNameLabel()
        createSearchTextField()
        createYearLabel()
        createYearTextField()
        createChooseTypeSegment()
        
        // Adding elements
        detailsStackView.addArrangedSubview(movieNameLabel)
        detailsStackView.addArrangedSubview(searchMovieTextField)
        detailsStackView.addArrangedSubview(yearLabel)
        detailsStackView.addArrangedSubview(yearTextField)
        detailsStackView.addArrangedSubview(chooseTypeSegment)
        
        // Constraints
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130),
            detailsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            detailsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    
    
    func createSearchTextField() {
        view.addSubview(searchMovieTextField)
        searchMovieTextField.delegate = self
        
        // Constraints
        NSLayoutConstraint.activate([
            searchMovieTextField.heightAnchor.constraint(equalToConstant: 45),
            searchMovieTextField.trailingAnchor.constraint(equalTo: detailsStackView.trailingAnchor, constant: -50)
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
        view.addSubview(movieNameLabel)
        movieNameLabel.text = "(Required) Movie Name:"
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
        let movieVC = MovieViewController()
        movInfoManager.fetchMovieData(movieName: searchMovieTextField.text!)
        self.navigationController?.pushViewController(movieVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buttonPressed()
        textField.endEditing(true)
        return true
    }
    
    

}
