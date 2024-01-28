//
//  TableViewDataSourceProtocol.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 28.01.24.
//

import Foundation
import UIKit
import CoreData

protocol CellIdentifiable{
    
    var cellIdentifier: String { get }
}

