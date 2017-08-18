//
//  AboutViewController.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 12/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import UIKit
import Social

class AboutViewController: UIViewController {

    @IBOutlet weak var lblVersion: UILabel!
    @IBOutlet weak var squirrelImage: UIImageView!
    @IBOutlet weak var lblSecretSquirrel: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblVersion.text = AppController.sharedInstance.appVersion() + " (" + AppController.sharedInstance.appBuildNumber() + ")"
        // Do any additional setup after loading the view.
        
        squirrelImage.popIn(fromScale: 0.5, duration: 0.5, delay: 0.2, completion: nil)
        lblSecretSquirrel.popIn(fromScale: 0.5, duration: 0.5, delay: 0.3, completion: nil)
        lblSubTitle.popIn(fromScale: 0.5, duration: 0.5, delay: 0.3, completion: nil)
    }
    


    @IBAction func didTouchWebSiteButton(_ sender: Any) {
        let url = URL(string: "http://www.deadfrogstudios.com")!
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func didTouchTweetButton(_ sender: Any) {
        let vc = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
        
        vc?.setInitialText("@deadfrogstudios. Secret Squirrel is...")
        
        self.present(vc!, animated: true, completion: nil)

    }
    
    func dialogBox()
    {
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


