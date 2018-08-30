//
//  Task+Convenience.swift
//  Task
//
//  Created by Markus Varner on 8/29/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import Foundation
import CoreData


extension Task{
    
    convenience init(name: String , notes: String? = nil, due: Date? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.name = name
        self.notes = notes
        self.due = due 
        self.isComplete = false
        
    }
    
}
