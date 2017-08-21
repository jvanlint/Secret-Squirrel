//
//  SettingsTableViewController.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 12/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.tableFooterView = UIView(frame: .zero)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }


}
