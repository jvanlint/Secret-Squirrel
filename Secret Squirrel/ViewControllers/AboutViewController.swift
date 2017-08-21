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
        
        // Update the version info on the screen.
        lblVersion.text = AppController.sharedInstance.appVersion() + " (" + AppController.sharedInstance.appBuildNumber() + ")"
        
        // Animate the squirrel image and heading/subheading labels.
        squirrelImage.popIn(fromScale: 0.5, duration: 0.5, delay: 0.2, completion: nil)
        lblSecretSquirrel.popIn(fromScale: 0.5, duration: 0.5, delay: 0.3, completion: nil)
        lblSubTitle.popIn(fromScale: 0.5, duration: 0.5, delay: 0.3, completion: nil)
    }
    


    @IBAction func didTouchWebSiteButton(_ sender: Any) {
        
        // Set the URL and open Safari to display website.
        let url = URL(string: "http://www.deadfrogstudios.com")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func didTouchTweetButton(_ sender: Any) {
        
        // Setup Twitter View Controller
        let vc = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
        
        // Set initial text.
        vc?.setInitialText("@deadfrogstudios. Secret Squirrel is...")
        
        // Show view controller to user.
        self.present(vc!, animated: true, completion: nil)
    }
}


