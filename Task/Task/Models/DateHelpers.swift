//
//  DateHelpers.swift
//  Task
//
//  Created by Markus Varner on 8/29/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
        //instantiate a DateFormatter, set its date style to .medium, then return the string
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
