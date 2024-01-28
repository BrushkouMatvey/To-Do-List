//
//  DataSource.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 22.01.24.
//

import UIKit

// MARK: TableView DataSource methods
extension ItemsViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoItemsContainer.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.itemCellIdentifier, for: indexPath)
        
        let item = toDoItemsContainer[indexPath.row]
        
        cell.textLabel?.text = item.message
        cell.accessoryType = item.isComplete ? .checkmark : .none
        
        return cell
    }
}
