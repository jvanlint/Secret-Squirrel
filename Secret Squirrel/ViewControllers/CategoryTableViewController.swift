//
//  CategoryTableViewController.swift
//  CodeNameGenerator
//
//  Created by Jason van Lint on 6/1/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var categories: [CodeWordCategory] = []
    
    var categoryPosition: String = "prefix"
    var selectedCategory: String = "test"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        categories = CodeWordCategories().categoriesData
        
        determineCategoryPosition()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)

        let categoryObject:CodeWordCategory = categories[indexPath.row]

        
        cell.textLabel?.text = categoryObject.categoryName
        cell.detailTextLabel?.text = categoryObject.categoryDesc
        
        if categoryObject.categoryName==selectedCategory{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoryObject:CodeWordCategory = categories[indexPath.row]
        
        switch categoryPosition {
        case "prefix":
            AppController.sharedInstance.prefix = categoryObject.categoryName
        case "middle":
            AppController.sharedInstance.middle = categoryObject.categoryName
        case "suffix":
            AppController.sharedInstance.suffix = categoryObject.categoryName
        default:
            AppController.sharedInstance.prefix = categoryObject.categoryName
        }

        determineCategoryPosition()
        AppController.sharedInstance.saveCategoryPreferencesToDisk()
        tableView.reloadData()
    }
    
    func determineCategoryPosition(){
        switch categoryPosition {
        case "prefix":
            selectedCategory = AppController.sharedInstance.prefix
        case "middle":
            selectedCategory = AppController.sharedInstance.middle
        case "suffix":
            selectedCategory = AppController.sharedInstance.suffix
        default:
            selectedCategory = AppController.sharedInstance.prefix
        }
    }

}
