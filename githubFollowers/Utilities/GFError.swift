//
//  ErrorMessage.swift
//  githubFollowers
//
//  Created by Daniel Kilders Díaz on 12/01/2020.
//  Copyright © 2020 Dani. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this user. Please try agian."
    case alreadyInFavorites = "You have already favorited this user."
}
