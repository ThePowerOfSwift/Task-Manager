//
//  ToDoTableViewController.swift
//  TaskManager
//
//  Created by Mihail Șalari on 8/1/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    // MARK: - Properties
    
    lazy var datasource: DataSource = {
        return DataSource(tableView: self.tableView)
    }()

    
    // MARK: - Lyfe Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        tableView.dataSource = datasource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Edit UIBarButtonItem
    
    override func editButtonItem() -> UIBarButtonItem {
        let editButton = super.editButtonItem()
        editButton.tintColor = UIColor.whiteColor()
        return editButton
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete
    }
    
  
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.ToDoTableViewController.UIStoryboardSegueShowItem {
            guard let destinationController = segue.destinationViewController as? DetailViewController, indexPath = tableView.indexPathForSelectedRow else { return }
            let item = datasource.objectAtIndexPath(indexPath) as! Item
            destinationController.item = item
        }
    }   
}

