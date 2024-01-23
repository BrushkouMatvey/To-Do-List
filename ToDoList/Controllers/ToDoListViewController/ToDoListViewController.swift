//
//  ViewController.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 21.01.24.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var items = [Item]()
    let saveLoadService = PListSaveLoadService<Item>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        items = saveLoadService.loadArray()
    }
    
    @IBAction func onAddButtonClicked(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        var alertController = UIAlertController(title: "Add new Item", message: "You can add new ToDo Item" + "😀", preferredStyle: .alert)
        
        var addAlertAction = UIAlertAction(title: "Add", style: .default) { action in
            self.addNewItem(message: textField.text!)
        }
        
        alertController.addTextField { configurationTextField in
            textField = configurationTextField
        }
        
        alertController.addAction(addAlertAction)
        present(alertController, animated: true)
        
    }
    
    
    private func addNewItem(message: String){
        items.append(Item(message, false))
        saveLoadService.saveArray(items)
        tableView.reloadData()
    }
}

