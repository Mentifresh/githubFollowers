//
//  NetworkManager.swift
//  githubFollowers
//
//  Created by Dani on 07/01/2020.
//  Copyright © 2020 Dani. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let baseURL = "https://api.github.com/users/"
    let requestedFollowers = 100
    
    private init() {
        
    }
    
    func getFollowers(for username: String, page: Int, closure: @escaping ([Follower]?, ErrorMessage?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=\(requestedFollowers)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            closure(nil, ErrorMessage.invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                closure(nil, .unableToComplete)
            }
            
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                    closure(nil, .invalidResponse)
                    return
            }
            
            guard let data = data else {
                closure(nil, .invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                closure(followers,nil)
            } catch {
                closure(nil, .invalidData)
            }
        }
        
        task.resume()
    }
}
