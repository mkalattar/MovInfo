//
//  MovInfoBrain.swift
//  Movinfo
//
//  Created by Mohamed Attar on 7/25/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import Foundation



class MovInfoManager {
    var title:String = "gg"
    
    let movieURL = "https://omdbapi.com/?apikey=6b8b171f"
    var urlString:String?
    
    func fetchMovieData(movieName: String) {
        urlString = "\(movieURL)&t=\(movieName)"
        performRequest(urlString: urlString!)
    }
    
    func performRequest(urlString: String){
        
        //Creating the URL
        if let url = URL(string: urlString) {
            // Creating URL Session
            let session = URLSession(configuration: .default)
            
            // Giving the Session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Do Not Procees")
                    return
                }
                if let safeData = data {
                    self.parseJSON(movInfoData: safeData)
                }
            }
            // Starting the task (resuming it from suspension)
            task.resume()
        }
    }
    
    func parseJSON(movInfoData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MovInfoData.self, from: movInfoData)
             setTitle(t: "\(decodedData.title) \(decodedData.year)")
        } catch {
            print(error)
        }
    }
    func setTitle(t: String) {
        title = t
    }
    func getTitle() -> String {
        return title
    }
}
