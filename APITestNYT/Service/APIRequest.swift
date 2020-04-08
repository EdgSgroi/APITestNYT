//
//  APIRequest.swift
//  APITestNYT
//
//  Created by Edgar Sgroi on 08/04/20.
//  Copyright © 2020 Edgar Sgroi. All rights reserved.
//

import Foundation

class APIRequest {
    
    func makeRequest(_ completion: @escaping (Result<Response, Error>) -> Void) {
        if let url = URL(string: "https://api.nytimes.com/svc/topstories/v2/technology.json?api-key=PFI7qwg5IiXdwtteGB86GzFJ3EYdRXcR") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(res))
                        }
                        
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
