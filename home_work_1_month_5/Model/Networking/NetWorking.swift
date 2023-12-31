//
//  NetWorking.swift
//  home_work_1_month_5
//
//  Created by Аяз on 21/6/23.
//

import UIKit
struct NetworkService {
    
    enum RickAndMortyError: Error {
        case UFO, RICK
    }
    
    static let shared = NetworkService()
    
    func fetchCharacters(
        completion: @escaping
        (Result<[Character], RickAndMortyError>) -> Void
    ) {
        let request = URLRequest(
            url: Constants.API.baseURL
                .appendingPathComponent("character")
        )
        URLSession.shared.dataTask(
            with: request
        ) { data, response, error in
            
            guard let data = data else {
                completion(.failure(.UFO))
                return
            }
            do {
                let model = try JSONDecoder().decode(
                    Characters.self,
                    from: data
                )
                completion(.success(model.results))
            } catch {
                completion(.failure(.RICK))
            }
        }
        .resume()
    }
}
