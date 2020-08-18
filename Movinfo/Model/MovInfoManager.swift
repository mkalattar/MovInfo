//
//  MovInfoBrain.swift
//  Movinfo
//
//  Created by Mohamed Attar on 7/25/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import Foundation



class MovInfoManager {
    static let shared   = MovInfoManager()
    let baseURL = "https://omdbapi.com/?apikey=6b8b171f"
    
    
     private init() {}
    
    
    func fetchMovieData(for movieName: String, completed: @escaping (Result<MovInfoData, ErrorMessage>) -> Void) {
        let endpoint = baseURL + "&t=\(movieName)&plot=full"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.badURL))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.badURL))
                
                return
            }
            
            guard let data = data else {
                completed(.failure(.badURL))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(MovInfoData.self, from: data)
                completed(.success(decodedData))
            } catch {
                completed(.failure(.badURL))
                
            }
        }
         task.resume()
    }
}
   

