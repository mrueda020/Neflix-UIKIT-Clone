//
//  APICaller.swift
//  Neflix-Clone
//
//  Created by Miguel Rueda Carbajal on 29/07/22.
//

import Foundation

enum APIError: Error {
    case failedTogetData
}

struct Constants {
    static let apiKey = "bd364fb3f44ccf45d4f8f867091bb292"
    static let baseURL = "https://api.themoviedb.org/3"
    static let trending = "/trending/all/week"
    static let netflixOriginals = "/discover/tv?with_networks=213"
    static let topRated = "/movie/top_rated"
    
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.trending)?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {return}
            print(data)
            do{
                let movies = try JSONDecoder().decode(MoviesResult.self, from: data)
                completion(.success(movies.results))
            }catch {
                completion(.failure(error))
            }

        }
        
        task.resume()
        
    }
    
}
