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
    
    func getFollowers(for username: String, page: Int, closure: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=\(requestedFollowers)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            closure(nil, "This username created an invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                closure(nil, "Unable to complete your request. Please check your internet connection")
            }
            
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                    closure(nil, "Invalid response from the server. Please try again.")
                    return
            }
            
            guard let data = data else {
                closure(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                closure(followers,nil)
            } catch {
                closure(nil, "The data received from the server was invalid. Please try again.")
            }
        }
        
        task.resume()
    }
}
