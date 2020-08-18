//
//  MovInfoData.swift
//  Movinfo
//
//  Created by Mohamed Attar on 7/25/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import Foundation

struct MovInfoData: Codable {
    let title, year: String
    let poster: String
    let plot: String
    let released: String
    let rated: String
    let runtime: String
    let genre: String
    let imdbRating: String
    let actors: String

    enum CodingKeys: String, CodingKey {
        case title      = "Title"
        case year       = "Year"
        case poster     = "Poster"
        case plot       = "Plot"
        case released   = "Released"
        case rated      = "Rated"
        case runtime    = "Runtime"
        case genre      = "Genre"
        case imdbRating = "imdbRating"
        case actors     = "Actors"
    }
}
