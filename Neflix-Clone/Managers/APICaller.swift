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
    static let trending = "/trending/movie/week"
    static let netflixOriginals = "/discover/tv?with_networks=213"
    static let topRated = "/movie/top_rated"
    static let upComingMovies = "/movie/upcoming"
    static let topRatedTV = "tv/top_rated"
}

class APICaller {
    static let shared = APICaller()
    
    func getNetflixOriginals(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.netflixOriginals)?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let netflixOriginals = try JSONDecoder().decode(MoviesResult.self, from: data)
                print(netflixOriginals)
                completion(.success(netflixOriginals.results))
            }catch{
                completion(.failure(error))
            }
            
        }
        
        task.resume()
        
    }
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.trending)?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {return}
            do{
                let movies = try JSONDecoder().decode(MoviesResult.self, from: data)
                completion(.success(movies.results))
            }catch {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
        
    }
    
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.upComingMovies)?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {return}
            do{
                let movies = try JSONDecoder().decode(MoviesResult.self, from: data)
                completion(.success(movies.results))
                
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.topRated)?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {return}
            do{
                let movies = try JSONDecoder().decode(MoviesResult.self, from: data)
                completion(.success(movies.results))
                
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRatedTV(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.topRatedTV)?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {return}
            do{
                let movies = try JSONDecoder().decode(MoviesResult.self, from: data)
                completion(.success(movies.results))
                
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
