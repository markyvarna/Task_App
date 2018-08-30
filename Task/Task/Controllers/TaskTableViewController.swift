//
//  TaskTableViewController.swift
//  Task
//
//  Created by Markus Varner on 8/29/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    //MARK: - Cell Protocol Func
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender) else {return}
        let task = TaskController.shared.tasks[indexPath.row]
        sender.update(withTasks: task)
        
        TaskController.shared.toggleIsCompleteFor(task: task)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.shared.fetchTasks().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ButtonTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? ButtonTableViewCell
        
        
        let task = TaskController.shared.tasks[indexPath.row]
        
        cell.delegate = self
        cell.update(withTasks: task)
        
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.remove(task: task)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToEditTask" {
            let destintationvc = segue.destination as? TaskDetailTableViewController
            guard let indexPath =  tableView.indexPathForSelectedRow?.row else {return}
            destintationvc?.task = TaskController.shared.tasks[indexPath]
            destintationvc?.dueDate = TaskController.shared.tasks[indexPath].due
        }
        
        
    }
    

}
