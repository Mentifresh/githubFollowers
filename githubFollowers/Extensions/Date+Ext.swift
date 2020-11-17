//
//  Date+Ext.swift
//  githubFollowers
//
//  Created by Dani Kilders on 17.11.20.
//  Copyright © 2020 Dani. All rights reserved.
//

import Foundation


extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
