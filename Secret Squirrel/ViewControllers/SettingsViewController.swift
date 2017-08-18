//
//  SettingsViewController.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 18/8/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var imgSquirrel: UIImageView!
    @IBOutlet weak var lblSecretSquirrel: UILabel!
    @IBOutlet weak var lblByLine: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgSquirrel.popIn(fromScale: 0.5, duration: 0.5, delay: 0.1, completion: nil)
        lblSecretSquirrel.slideIn(from: .right, x: 0, y: 0, duration: 0.4, delay: 0.1, completion: nil)
        lblByLine.slideIn(from: .right, x: 0, y: 0, duration: 0.4, delay: 0.1, completion: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
