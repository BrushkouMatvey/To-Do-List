//
//  UITableViewCell.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 21.01.24.
//

import Foundation
import UIKit

extension UITableViewCell{
    
    func changeAccessoryType(type: AccessoryType, animated: Bool, duration: TimeInterval, _ completion: ((Bool) -> Void)? = nil) {
        
        if animated{
            UIView.transition(
                with: self,
                duration: duration,
                options: .transitionCrossDissolve,
                animations: { self.accessoryType = type },
                completion: completion)
        }else{
            self.accessoryType = type
        }
    }
}
