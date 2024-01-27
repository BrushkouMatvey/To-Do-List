//
//  Delegate.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 24.01.24.
//

import Foundation
import UIKit
import CoreData

extension ToDoListViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            loadItems()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            return
        }
        
        searchItems(with: searchText)
    }
    
    func searchItems(with str: String){
        loadItems(
            NSPredicate(format: "message CONTAINS[cd] %@", str),
            [NSSortDescriptor(key: "message", ascending: true)]
        )
    }
}
