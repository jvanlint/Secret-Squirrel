//
//  CategoryTableViewController.swift
//  CodeNameGenerator
//
//  Created by Jason van Lint on 6/1/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var categories: [String] = []
    
    var categoryPosition: String = "prefix"
    var selectedCategory: String = "test"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let categoryData = Category()
        categories = categoryData.arrayOfAllCategories()
        
        determineCategoryPosition()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)

        let category = categories[indexPath.row]
        
        cell.textLabel?.text = category
        cell.detailTextLabel?.text = "Description of category here."
        
        if category==selectedCategory{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        
        switch categoryPosition {
        case "prefix":
            AppController.sharedInstance.prefix = category
        case "middle":
            AppController.sharedInstance.middle = category
        case "suffix":
            AppController.sharedInstance.suffix = category
        default:
            AppController.sharedInstance.prefix = category
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
