//
//  UITableViewExtensions.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 28.01.24.
//

import Foundation
import UIKit

extension UITableView{
    
    func animateAccessoryTypeCheckmark(_ indexPath: IndexPath, _ item: Item) {
        
        if let cell = cellForRow(at: indexPath){
            
            cell.changeAccessoryType(
                type: item.isComplete ? .checkmark : .none,
                animated: true,
                duration: 0.3
            )
        }
    }
}
