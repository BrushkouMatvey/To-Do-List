//
//  CategoriesViewController.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 27.01.24.
//

import Foundation
import UIKit
import CoreData

class CategoriesViewController : UITableViewController{
    
    let itemsContainer = CoreDataContainer<Category>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
    }
    
    @IBAction func onAddButtonClicked(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alertController = UIAlertController(title: "Add new Category", message: "You can add new Category" + "😀", preferredStyle: .alert)
        
        let addAlertAction = UIAlertAction(title: "Add", style: .default) { action in
            self.addNewItem(name: textField.text!)
        }
        
        alertController.addTextField { configurationTextField in
            textField = configurationTextField
        }
        
        alertController.addAction(addAlertAction)
        present(alertController, animated: true)
    }
    
    
    private func addNewItem(name: String){
        
        if let item = itemsContainer.createAndAddEntity(){
 
            item.name = name
            item.id = Int32(itemsContainer.count - 1)
            saveItems()
        }
    }
}
