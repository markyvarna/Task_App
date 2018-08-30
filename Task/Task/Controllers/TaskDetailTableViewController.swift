//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Markus Varner on 8/29/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dueDateTextField: UITextField!
    @IBOutlet var notesTextView: UITextView!
    @IBOutlet var datePicker: UIDatePicker!
    
    //Properties
    var task: Task? {
        didSet{
            
            updateView()
        }
    }
    var dueDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = datePicker
        updateView()
        
    }
    
    //MARK: - Custom Methods
   private func updateView() {
        
    guard let task = task, isViewLoaded else {return}
    title = task.name
    nameTextField.text = task.name
    dueDateTextField.text = (task.due as Date?)?.stringValue()
    notesTextView.text = task.notes
        
    }
    
    private func updateTask() {
        //if the task landing pad is not empty
        
        guard let nameText = nameTextField.text else {return}
        let due = dueDate
        let notes = notesTextView.text
        if let task = self.task {
            TaskController.shared.update(task: task, name: nameText, notes: notes, due: due)
        } else {
            TaskController.shared.add(taskWithName: nameText, notes: notes, due: due)
        }
        
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        updateTask()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        dueDate = sender.date
        dueDateTextField.text = sender.date.stringValue()
        
    }
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        
        nameTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
        datePicker.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
        
    }
    
    

}
