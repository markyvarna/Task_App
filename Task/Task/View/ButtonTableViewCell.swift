//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Markus Varner on 8/29/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit



class ButtonTableViewCell: UITableViewCell {
    
    //Delegate Property Optional
    weak var delegate: ButtonTableViewCellDelegate?
    
    
    //MARK: - Outlets
    @IBOutlet var primaryLabel: UILabel!
    @IBOutlet var completeButton: UIButton!
    
    //MARK: - Custom Methods
    func updateButton(_ isComplete: Bool) {
        
        if isComplete {
            completeButton.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            completeButton.setImage(UIImage(named: "unChecked"), for: .normal)
        }
        
    }
    
    //MARK: - Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.buttonCellButtonTapped(self)
        
    }
    
}
extension ButtonTableViewCell {
    
    func update(withTasks task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
    
}
protocol ButtonTableViewCellDelegate: class{
    
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
    
}

