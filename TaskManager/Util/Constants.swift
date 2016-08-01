//
//  Constants.swift
//  TaskManager
//
//  Created by Mihail Șalari on 8/1/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

struct Constants {
    
    static let DomainError = "com.mihailsalari.CoreDataError"
    static let Code = 9999
    
    struct CoreDataStack {
        static let URLByAppendingPathComponent = "TodoList.sqlite"
        static let URLForResource = "TodoList"
        static let WithExtension = "momd"
        static let NSLocalizedDescriptionKeyError = "Failed to initializa the application's saved data"
        static let NSLocalizedFailureReasonErrorKeyError = "There was an eror creating of loading the application's saved data"
    }
    
    struct DataSource {
        static let CellIdentifier = "Cell"
    }
    
    struct DetailViewController {
        static let FatalError = "Cannot show detail without an item"
    }
    
    struct ToDoTableViewController {
        static let UIStoryboardSegueShowItem = "ShowItem"
    }
    
    struct ViewController {
        static let Item = "Item"
    }
}