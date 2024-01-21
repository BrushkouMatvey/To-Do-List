//
//  DataSource.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 22.01.24.
//

import UIKit

// MARK: TableView DataSource methods
extension ToDoListViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.message
        cell.accessoryType = item.isDone ? .checkmark : .none
        
        return cell
    }
}
