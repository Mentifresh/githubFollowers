//
//  FollowerListVC.swift
//  githubFollowers
//
//  Created by Dani on 06/01/2020.
//  Copyright © 2020 Dani. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
    }
}
