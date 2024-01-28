//
//  ViewController.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 21.01.24.
//

import UIKit
import CoreData

class ItemsViewController: UITableViewController {
    
    let toDoItemsContainer = CoreDataContainer<Item>()

    var parentCategory: Category?{
        didSet{
            let compoundPredicate = NSCompoundPredicate(
                andPredicateWithSubpredicates: [NSPredicate(format: "parentCategory.id == %i", parentCategory!.id)]
            )
            loadItems(compoundPredicate)
        }
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
            item.parentCategory = parentCategory
            saveItems()
        }
    }
}

