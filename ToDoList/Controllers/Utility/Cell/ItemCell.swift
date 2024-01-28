//
//  ItemCell.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 28.01.24.
//

import Foundation
import UIKit
import CoreData

class ItemCell : UITableViewCell, CellConfigurable{
    
    func configure(with entity: NSManagedObject) {
        guard let itemEntity = entity as? Item else { fatalError("Can't configure Item cell") }

        textLabel?.text = itemEntity.message
        accessoryType = itemEntity.isComplete ? .checkmark : .none
    }
    
}
