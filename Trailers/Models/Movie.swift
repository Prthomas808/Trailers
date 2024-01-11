//
//  Movie.swift
//  Trailers
//
//  Created by Pedro Thomas on 1/11/24.
//

import Foundation

struct Movie: Codable, Identifiable {
    let adult: Bool
    let id: Int
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteAverage: Float
}
