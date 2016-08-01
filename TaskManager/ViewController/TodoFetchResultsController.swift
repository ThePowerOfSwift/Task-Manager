//
//  TodoFetchResultsController.swift
//  TaskManager
//
//  Created by Mihail Șalari on 8/1/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit
import CoreData

class TodoFetchResultsController: NSFetchedResultsController, NSFetchedResultsControllerDelegate {
    
    // MARK: - Properties

    private let tableView: UITableView
    
    
    // MARK: - Initializers
    
    init(managedObjectContext: NSManagedObjectContext, withTableView tableView: UITableView) {
        self.tableView = tableView
        super.init(fetchRequest: Item.fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        self.delegate = self
        
        tryFetch()
    }
    
    // MARK: - Perform Fetch
    
    func tryFetch() {
        do {
            try performFetch()
        } catch let error as NSError {
            print("Unresolved error: \(error), \(error.userInfo)")
        }
    }
    
    // MARK: - NSFetchedResultsControllerDelegate
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            guard let indexPath = newIndexPath else { return }
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        case .Delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        case .Update, .Move:
            guard let indexPath = indexPath else { return }
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }  
}
