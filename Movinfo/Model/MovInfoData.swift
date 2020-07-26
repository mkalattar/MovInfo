//
//  MovInfoData.swift
//  Movinfo
//
//  Created by Mohamed Attar on 7/25/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import Foundation

struct MovInfoData: Decodable {
    let title:String
    let year:String
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
    }
}
