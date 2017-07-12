//
//  AboutViewController.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 12/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var lblVersion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblVersion.text = AppController.sharedInstance.appVersion()
        // Do any additional setup after loading the view.
    }


    @IBAction func didTouchWebSiteButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Destructive", message: "Simple alertView demo with Destructive and Ok.", preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
        let DestructiveAction = UIAlertAction(title: "Destructive", style: UIAlertActionStyle.destructive) {
            (result : UIAlertAction) -> Void in
            print("Destructive")
        }
        
        // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
