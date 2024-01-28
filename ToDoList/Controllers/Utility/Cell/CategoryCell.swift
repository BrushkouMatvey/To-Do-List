//
//  CategoryCell.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 28.01.24.
//

import Foundation
import UIKit
import CoreData

class CategoryCell : UITableViewCell, CellConfigurable{
    
    func configure(with entity: NSManagedObject) {
        
        guard let categoryEntity = entity as? Category else { fatalError("Can't configure Category cell") }
    
        textLabel?.text = categoryEntity.name
    }
    
    
    func configure(with entity: Category) {
        textLabel?.text = entity.name
    }

}
