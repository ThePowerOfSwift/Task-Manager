//
//  DataSource.swift
//  TaskManager
//
//  Created by Mihail Șalari on 8/1/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    private let tableView: UITableView
    
    let managedObjectContext = DataController.sharedInstance.managedObjectContext
    
    lazy var fetchResultsController: TodoFetchResultsController = {
        let controller = TodoFetchResultsController(managedObjectContext: self.managedObjectContext, withTableView: self.tableView)
        
        return controller
    }()
    
    
    // MARK: - Initializers
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    
    // MARK: - NSManagedObject
    
    func objectAtIndexPath(indexPath: NSIndexPath) -> NSManagedObject {
        return fetchResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchResultsController.sections?.count ?? 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchResultsController.sections?[section] else { return 0}
        return sections.numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.DataSource.CellIdentifier, forIndexPath: indexPath)
        return configureCell(cell, atIndexPath: indexPath)
    }
    
    private func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = fetchResultsController.objectAtIndexPath(indexPath) as! Item
        cell.textLabel?.text = item.text
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let item = fetchResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
        managedObjectContext.deleteObject(item)
        DataController.sharedInstance.saveContacts()
    }

}