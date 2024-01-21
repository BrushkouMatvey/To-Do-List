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
}

