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
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableDataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "themeCell", for: indexPath) as! ThemeTableViewCell
        
        let themeObject = tableDataSource[indexPath.row]
        
        cell.lblThemeName.text = themeObject.name
        cell.lblThemeDescription.text = themeObject.description
 
        if indexPath.row % 2 == 1{
            cell.backgroundColor = UIColor.midnightBlueColor().withAlphaComponent(0.90)
        } else {
            cell.backgroundColor = UIColor.midnightBlueColor().withAlphaComponent(1.0)
        }
        
        if (themeObject.categories.0 == AppController.sharedInstance.prefix) && (themeObject.categories.1 == AppController.sharedInstance.middle) && (themeObject.categories.2 == AppController.sharedInstance.suffix){
            cell.imgCheckmark.isHidden = false
        } else {
            cell.imgCheckmark.isHidden = true
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let themeObject:Theme = tableDataSource[indexPath.row]
        
        AppController.sharedInstance.prefix = themeObject.categories.0
        AppController.sharedInstance.middle = themeObject.categories.1
        AppController.sharedInstance.suffix = themeObject.categories.2
        
        _ = navigationController?.popToRootViewController(animated: true)
    }
}
