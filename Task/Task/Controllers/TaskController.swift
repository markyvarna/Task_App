//
//  TaskController.swift
//  Task
//
//  Created by Markus Varner on 8/29/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    //Shared Instance
    static let shared = TaskController()
    
    init(){
        tasks = fetchTasks()
    }
    
    //Source of Truth
    var tasks: [Task] = []
    //Mock Data
//    var mockTasks: [Task] {
//        let mockTask1 = Task(name: "MA1", notes: nil, due: Date(), context: CoreDataStack.context)
//        let mockTask2 = Task(name: "MA2", notes: "MMMMMM", due: Date(), context: CoreDataStack.context)
//        let mockTask3 = Task(name: "MA3", notes: nil, due: Date(), context: CoreDataStack.context)
//
//        return [mockTask1, mockTask2, mockTask3]
//    }
    
    func add(taskWithName name: String, notes: String?, due: Date? ) {
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    func update(task: Task, name: String, notes: String?, due: Date?) -> [Task] {
        task.name = name
        task.notes = notes
        task.due = due
        
        saveToPersistentStore()
        tasks = fetchTasks()
        
        return tasks
    }
    func remove(task: Task) {
       task.managedObjectContext?.delete(task)
        
        saveToPersistentStore()
       
        
    }
    func toggleIsCompleteFor(task: Task ) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    func saveToPersistentStore() {
        
        do {
        try CoreDataStack.context.save()
        } catch {
            print("There was an Errro Saving to the Context : \(error)")
        }
        
    }
    func fetchTasks() -> [Task] {
        
        let  request: NSFetchRequest<Task> = Task.fetchRequest()
        _ = NSSortDescriptor.init(key: "due", ascending: true)
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    
}
