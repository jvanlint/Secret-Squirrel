//
//  CategoryDetailTableViewController.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 14/8/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import UIKit

class CategoryDetailTableViewController: UITableViewController {
    
    var categoryName = "Test"
    var dataSource = ["Test", "Test2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let categoryData = CodeWordCategories()
        self.dataSource = categoryData.arrayOfWords(forCategory: self.categoryName)
        self.navigationItem.title=categoryName
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    func addTapped(){
            let alertController = UIAlertController(title: "Add Category Item", message: "Please input your new category item:", preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
                if let field = alertController.textFields?[0] {
                    // store your data
                    self.dataSource.append(field.text!)
                    self.tableView.reloadData()
                } else {
                    // user did not fill field
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
            
            alertController.addTextField { (textField) in
                textField.placeholder = "New Category Item"
            }
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryDetailCell", for: indexPath)

        // Configure the cell...
        let label = cell.viewWithTag(100) as! UILabel
        label.text = dataSource[indexPath.row].capitalized
    
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
