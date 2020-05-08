//
//  ErgastAPI.swift
//
//
//  Created by Giovanni Noa on 4/28/20.
//

/// Public interface of functions for fetching Formula 1 data from the Ergast REST API.
public struct ErgastAPI {
    
    /// Fetches Formula 1 Circuits for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020). 
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func circuits(for season: SeasonYear,
                                completion: @escaping (Result<Circuits, ErgastAPIError>) -> Void) {
        
        ErgastAPIService.fetch(.circuits,
                               for: season,
                               decodingType: Circuits.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Fetches Formula 1 Circuits for all seasons throughout history.
    /// - Parameter completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func allCircuits(completion: @escaping (Result<Circuits, ErgastAPIError>) -> Void) {
        ErgastAPIService.fetch(.circuits,
                               for: nil,
                               decodingType: Circuits.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // Fetches Formula 1 Seasons throughout history.
    public static func seasons(completion: @escaping (Result<Seasons, ErgastAPIError>) -> Void) {
        ErgastAPIService.fetch(.seasons, decodingType: Seasons.self) { result in
            completion(result)
        }
    }
}

