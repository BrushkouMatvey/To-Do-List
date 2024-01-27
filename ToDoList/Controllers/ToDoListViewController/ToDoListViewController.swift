//
//  ViewController.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 21.01.24.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {
    
    let toDoItemsContainer = CoreDataContainer<Item>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
    }
    
    @IBAction func onAddButtonClicked(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alertController = UIAlertController(title: "Add new Item", message: "You can add new ToDo Item" + "😀", preferredStyle: .alert)
        
        let addAlertAction = UIAlertAction(title: "Add", style: .default) { action in
            self.addNewItem(message: textField.text!)
        }
        
        alertController.addTextField { configurationTextField in
            textField = configurationTextField
        }
        
        alertController.addAction(addAlertAction)
        present(alertController, animated: true)
        
    }
    
    
    private func addNewItem(message: String){
        
        if let item = toDoItemsContainer.createAndAddEntity(){
            item.message = message
            item.isComplete = false
            saveItems()
        }
    }
}

