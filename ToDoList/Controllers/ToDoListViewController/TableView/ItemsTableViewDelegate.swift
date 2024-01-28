//
//
//  Delegate.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 22.01.24.
//

import UIKit

// MARK: TableView Delegate methods
extension ItemsViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = itemsContainer[indexPath.row]
        item.isComplete = !item.isComplete
        
        itemsContainer.save()
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.animateAccessoryTypeCheckmark(indexPath, item)
    }
}
