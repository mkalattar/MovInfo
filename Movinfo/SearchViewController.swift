//
//  SearchViewController.swift
//  Movinfo
//
//  Created by Mohamed Attar on 7/25/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

let items = ["Movie", "TV Show"]
var movInfoManager = MovInfoManager()

let searchButton            = UIButton()
let image                   = UIImage(named: "Image")
let imageView               = UIImageView(image: image!)
let verticalStackView       = UIStackView()
let searchMovieTextField    = UITextField()
let yearTextField           = UITextField()
let movieNameStackView      = UIStackView()
let movieYearStackView      = UIStackView()
let movieDetailsStackView   = UIStackView()
let movieNameLabel          = UILabel()
let yearLabel               = UILabel()
let chooseTypeSegment       = UISegmentedControl(items: items)

class SearchViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        createMovieDetailsStackView()
        view.backgroundColor = .systemGray6
    }
    
    func createHStackView() {
        view.addSubview(movieNameStackView)
        movieNameStackView.axis         = .vertical
        movieNameStackView.spacing      = 5
        movieNameStackView.alignment    = .leading
        
        
        // Creating Elements
        createMovieNameLabel()
        createSearchTextField()
        
        
        // Adding Elements
        movieNameStackView.addArrangedSubview(movieNameLabel)
        movieNameStackView.addArrangedSubview(searchMovieTextField)
        
        
        // Constraints
        movieNameStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createChooseTypeSegment() {
        view.addSubview(chooseTypeSegment)
        chooseTypeSegment.selectedSegmentIndex = 0
        chooseTypeSegment.backgroundColor = .systemFill
        chooseTypeSegment.selectedSegmentTintColor = .systemGray
        
        
        // Constraints
        chooseTypeSegment.leadingAnchor.constraint(equalTo: searchMovieTextField.leadingAnchor).isActive = true
    }
    
    func createMovieDetailsStackView(){
        view.addSubview(movieDetailsStackView)
        movieDetailsStackView.axis         = .vertical
        movieDetailsStackView.spacing      = 30
        movieDetailsStackView.alignment    = .bottom
        movieDetailsStackView.distribution = .fillProportionally
        
        
        // Creating Elements
        createHStackView()
        createMovieYearStackView()
        createChooseTypeSegment()
        createButton()
        
        // Adding Elements
        movieDetailsStackView.addArrangedSubview(movieNameStackView)
        movieDetailsStackView.addArrangedSubview(movieYearStackView)
        movieDetailsStackView.addArrangedSubview(chooseTypeSegment)
        movieDetailsStackView.addArrangedSubview(searchButton)
        
        
        // Constraints
        movieDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        movieDetailsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        movieDetailsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -150).isActive = true
        movieDetailsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        movieDetailsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    func createMovieNameLabel() {
        view.addSubview(movieNameLabel)
        movieNameLabel.text = "*Movie Name:"
        
        // Constraints
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createYearLabel() {
        view.addSubview(yearLabel)
        yearLabel.text = "Year:"
        
        // Constraints
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createMovieYearStackView() {
        view.addSubview(movieYearStackView)
        movieYearStackView.axis         = .vertical
        movieYearStackView.spacing      = 5
        movieYearStackView.alignment    = .leading
        
        // Creating Elements
        createYearLabel()
        createYearTextField()
        
        
        // Adding Elements
        movieYearStackView.addArrangedSubview(yearLabel)
        movieYearStackView.addArrangedSubview(yearTextField)
        
        
        // Constraints
        movieYearStackView.translatesAutoresizingMaskIntoConstraints                                            = false
    }
    
    func createYearTextField() {
        view.addSubview(yearTextField)
        
        yearTextField.placeholder            = "e.g. 1974"
        yearTextField.layer.cornerRadius     = 10
        yearTextField.delegate               = self
        yearTextField.textAlignment          = .center
        yearTextField.backgroundColor        = .systemFill
        yearTextField.clearButtonMode        = .always
        yearTextField.keyboardType           = .numberPad
        
        // Constraints
        yearTextField.translatesAutoresizingMaskIntoConstraints              = false
        yearTextField.heightAnchor.constraint(equalToConstant: 45).isActive  = true
        yearTextField.leadingAnchor.constraint(equalTo: searchMovieTextField.leadingAnchor).isActive = true
        yearTextField.trailingAnchor.constraint(equalTo: searchMovieTextField.trailingAnchor).isActive = true
    }
    
    func createSearchTextField() {
        view.addSubview(searchMovieTextField)
        
        searchMovieTextField.placeholder            = "e.g. Star Wars"
        searchMovieTextField.layer.cornerRadius     = 10
        searchMovieTextField.delegate               = self
        searchMovieTextField.textAlignment          = .center
        searchMovieTextField.backgroundColor        = .systemFill
        searchMovieTextField.clearButtonMode        = .always
        searchMovieTextField.autocapitalizationType = .words
        
        // Constraints
        searchMovieTextField.translatesAutoresizingMaskIntoConstraints              = false
        searchMovieTextField.heightAnchor.constraint(equalToConstant: 45).isActive  = true
        searchMovieTextField.trailingAnchor.constraint(equalTo: movieDetailsStackView.trailingAnchor, constant: -30).isActive = true
    }
    
    
    func createImage() {
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        
        // Constraints
        imageView.translatesAutoresizingMaskIntoConstraints                 = false
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive    = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive     = true
    }
    
    func createButton() {
        view.addSubview(searchButton)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 45, weight: .light, scale: .small)
        searchButton.setImage(UIImage(systemName: "arrow.right.circle.fill", withConfiguration: largeConfig), for: .normal)
        searchButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        searchButton.tintColor = .systemGray

        
        // Constraints
        searchButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func buttonPressed() {
        let movieVC = MovieViewController()
        movInfoManager.fetchMovieData(movieName: searchMovieTextField.text!)
        movieVC.title = movInfoManager.getTitle()
        self.navigationController?.pushViewController(movieVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buttonPressed()
        textField.endEditing(true)
        return true
    }
    
    

}
