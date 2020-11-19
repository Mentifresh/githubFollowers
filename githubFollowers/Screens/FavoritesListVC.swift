//
//  FavoritesListVC.swift
//  githubFollowers
//
//  Created by Dani on 04/01/2020.
//  Copyright © 2020 Dani. All rights reserved.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        PersistanceManager.retrieveFavorites { (result) in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }
}
