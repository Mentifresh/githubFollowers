//
//  User.swift
//  githubFollowers
//
//  Created by Dani on 07/01/2020.
//  Copyright © 2020 Dani. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
