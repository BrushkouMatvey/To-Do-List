//
//  ViewController.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 21.01.24.
//

import UIKit
typealias AccessoryType = UITableViewCell.AccessoryType


class ToDoListViewController: UITableViewController {
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.append(Item("Test item 1", false))
        items.append(Item("Test item 2", false))
        items.append(Item("Test item 3", false))
    }
}


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

// MARK: TableView Delegate methods
extension ToDoListViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        item.switchIsDone()
        tableView.deselectRow(at: indexPath, animated: true)
        animateAccessoryTypeCheckmark(tableView, indexPath, item)
    }
    
    private func animateAccessoryTypeCheckmark(_ tableView: UITableView, _ indexPath: IndexPath, _ item: Item) {
        
        if let cell = tableView.cellForRow(at: indexPath){
        
            cell.changeAccessoryType(
                type: item.isDone ? .checkmark : .none,
                animated: true,
                duration: 0.3
            )
        }
    }
}

