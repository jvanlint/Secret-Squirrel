//
//  ThemesTableViewController.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 12/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import UIKit

class ThemesTableViewController: UITableViewController {
    
    var tableDataSource: [Theme] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableDataSource = Themes().themesList
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //self.tableView.backgroundColor = UIColor.turquoiseColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.tableDataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "themeCell", for: indexPath) as! ThemeTableViewCell
        
        let themeObject = tableDataSource[indexPath.row]
        
        cell.lblThemeName.text = themeObject.name
        cell.lblThemeDescription.text = themeObject.description

        
        //let perLevel:CGFloat = CGFloat(1.0) / CGFloat(self.tableDataSource.count)
        //let alphaValue = perLevel + CGFloat(indexPath.row) * perLevel
 
        
        if indexPath.row % 2 == 1{
            cell.backgroundColor = UIColor.midnightBlueColor().withAlphaComponent(0.90)
        } else {
            cell.backgroundColor = UIColor.midnightBlueColor().withAlphaComponent(1.0)
        }
        
        
       // cell.backgroundColor = UIColor.pomergranateColor().withAlphaComponent(alphaValue)
        
      
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let themeObject:Theme = tableDataSource[indexPath.row]
        
        AppController.sharedInstance.prefix = themeObject.categories.0
        AppController.sharedInstance.middle = themeObject.categories.1
        AppController.sharedInstance.suffix = themeObject.categories.2
        
        //_ = navigationController?.popViewController(animated: true)
        _ = navigationController?.popToRootViewController(animated: true)
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
