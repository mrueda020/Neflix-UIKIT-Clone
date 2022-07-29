//
//  Movie.swift
//  Neflix-Clone
//
//  Created by Miguel Rueda Carbajal on 29/07/22.
//

import Foundation

struct MoviesResult:Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String?
    let overview: String?
    let poster_path: String?
    let media_type: String?
    let original_title: String?
    let backdrop_path: String?
    let release_date: String?
    let vote_average: Float
    let vote_count: Int
}
