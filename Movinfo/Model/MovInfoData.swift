//
//  MovInfoData.swift
//  Movinfo
//
//  Created by Mohamed Attar on 7/25/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import Foundation

struct MovInfoData: Codable {
    let title, year, rated, released: String
    let runtime, genre, actors, plot: String
    let language, country, awards: String
    let poster: String
    let imdbRating, imdbID, type, production: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case imdbRating, imdbID
        case type = "Type"
        case production = "Production"
    }
}
