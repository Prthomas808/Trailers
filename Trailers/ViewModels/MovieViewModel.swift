//
//  MovieViewModel.swift
//  Trailers
//
//  Created by Pedro Thomas on 1/11/24.
//

import Foundation

@MainActor
class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    let apiKey = "9289e49bd9aaa2673be7014b9af0cfd8"
    let baseURL = "https://api.themoviedb.org/3/"
    
    func loadTrendingMovies() {
        let endpoint = "\(baseURL)trending/movie/day?api_key=\(apiKey)"
        
        Task {
            guard let url = URL(string: endpoint) else {
                print(TrailersError.invalidURL)
                return
            }
            
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print(TrailersError.invalidResponse)
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(MovieResults.self, from: data)
                movies = results.results
            } catch {
                print(TrailersError.invalidData)
            }
        }
    }
}

enum TrailersError: String, Error {
    case invalidURL = "The URL entered is invalid"
    case invalidResponse = "There was an error with the response"
    case invalidData = "There was an error with the data"
}
