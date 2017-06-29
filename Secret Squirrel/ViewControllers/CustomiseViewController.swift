//
//  CustomiseViewController.swift
//  CodeNameGenerator
//
//  Created by Jason van Lint on 3/1/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import UIKit

class CustomiseViewController: UIViewController {

    @IBOutlet weak var lblPrefix: UILabel!
    @IBOutlet weak var lblMiddle: UILabel!
    @IBOutlet weak var lblSuffix: UILabel!
    
    @IBOutlet weak var lblPrefixCategory: UILabel!
    @IBOutlet weak var lblMiddleCategory: UILabel!
    @IBOutlet weak var lblSuffixCategory: UILabel!
    
    var categoryNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshCategoryLabels()
        refreshCodeNameExample()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshCategoryLabels()
        refreshCodeNameExample()
    }
    
    @IBAction func didTouchTestCodeButton(_ sender: Any) {
        refreshCodeNameExample()
    }
    
    func refreshCodeNameExample()
    {
        let sampleCodeName = CodeName()
        lblPrefix.text = sampleCodeName.prefix
        lblMiddle.text = sampleCodeName.middle
        lblSuffix.text = sampleCodeName.suffix
        
    }
    
    func refreshCategoryLabels()
    {
        lblPrefixCategory.text = AppController.sharedInstance.prefix
        lblMiddleCategory.text = AppController.sharedInstance.middle
        lblSuffixCategory.text = AppController.sharedInstance.suffix
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "prefix"
        {
            if let destViewController = segue.destination as? CategoryTableViewController
            {
                destViewController.categoryPosition = "prefix"
            }
        }else if segue.identifier == "middle"{
            if let destViewController = segue.destination as? CategoryTableViewController
            {
                destViewController.categoryPosition = "middle"
            }
        }else if segue.identifier == "suffix"{
                if let destViewController = segue.destination as? CategoryTableViewController
                {
                    destViewController.categoryPosition = "suffix"
                }
        }
        
        
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
 

   
}
