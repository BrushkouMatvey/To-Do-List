//
//  Delegate.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 22.01.24.
//

import UIKit

// MARK: TableView Delegate methods
extension ToDoListViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = toDoItemsContainer[indexPath.row]
        item.isComplete = !item.isComplete
        
        toDoItemsContainer.save()
        
        tableView.deselectRow(at: indexPath, animated: true)
        animateAccessoryTypeCheckmark(tableView, indexPath, item)
    }
    
    private func animateAccessoryTypeCheckmark(_ tableView: UITableView, _ indexPath: IndexPath, _ item: Item) {
        
        if let cell = tableView.cellForRow(at: indexPath){
            
            cell.changeAccessoryType(
                type: item.isComplete ? .checkmark : .none,
                animated: true,
                duration: 0.3
            )
        }
    }
}
