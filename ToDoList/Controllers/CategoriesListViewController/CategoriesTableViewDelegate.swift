//
//  CategoriesTableViewDelegate.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 28.01.24.
//

import UIKit

// MARK: TableView Delegate methods
extension CategoriesViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.goToItemsSegueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.goToItemsSegueIdentifier{
            
            if let destinationVC = segue.destination as? ItemsViewController {
                
                if let indexPath = tableView.indexPathForSelectedRow{
                    destinationVC.parentCategory = itemsContainer[indexPath.row]
                }
            }
        }
    }
}
