//
//  GenerateCodeViewController.swift
//  CodeNameGenerator
//
//  Created by Jason van Lint on 12/09/2016.
//  Copyright © 2016 Dead Frog Studios. All rights reserved.
//

import UIKit
import MessageUI                                        //Framework to enable eMail and SMS. Requires delegates for email
                                                        //and SMS to specified after class declaration.

class GenerateCodeViewController: UIViewController {
    
    //MARK: - Instance Variables
    
    var currentColorIndex = 1                           //Keeps track of current color to help the same color being randomised
                                                        //twice in a row.
    let messageObject = MessageComposer()                //Instance of MessageComposer declared at a scope that can be seen
                                                        //throughout the lifetime of the View Controller 
                                                        //(so that the delegate callback can be invoked when appropriate).
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var lblCodeName: UILabel!            //Label displaying the generated code name
    @IBOutlet weak var lblVersion: UILabel!             //App version label
    @IBOutlet weak var lblProject: UILabel!             //Label displaying the text Project or Operation
    @IBOutlet weak var btnProject: WireFrameButton!     //The button switching between Project and Operation
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        updateAppVersionLabel()                         //Update the version number string.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        generateNewProjectCode()
    }
    
    
    //MARK: - User Interaction Methods
    
    @IBAction func didTouchGenerateButton(_ sender: AnyObject) {
        
        generateNewProjectCode()
    }
    
    @IBAction func didTouchMessagingButton(_ sender: UIBarButtonItem) {
        
        let projectText = lblProject.text!
        let codenameText = lblCodeName.text!
        
        let subjectText = "A Secret Squirrel generated code name has been selected!"
        let messageText = "The \(projectText) should now be referred to as: \(projectText) \(codenameText)"
        
        let alertController = UIAlertController(title: nil, message: "Message Type", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(cancelAction)
        
        let emailAction = UIAlertAction(title: "Email", style: .default) { (action) in
            self.sendEmailWith(message: messageText, subject: subjectText)
        }
        alertController.addAction(emailAction)
        
        let smsAction = UIAlertAction(title: "SMS/iMessage", style: .default) { (action) in
            self.sendSMSWith(message: messageText)
        }
        alertController.addAction(smsAction)
        
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func didTouchOperationButton(_ sender: AnyObject) {
        
        if lblProject.text == "PROJECT"{
            lblProject.text="OPERATION"
            btnProject.setTitle("It's a Project", for: .normal)
        }else{
            lblProject.text="PROJECT"
            btnProject.setTitle("It's an Operation", for: .normal)
        }
    }
    
    //MARK: - Messaging Functions
    
    /// <#Description#>
    ///
    /// - parameter message: <#message description#>
    /// - parameter subject: <#subject description#>
    func sendEmailWith(message: String, subject: String) {
        
        let emailMessageVC = messageObject.sendEmailWith(bodyText: message, subjectText: subject)
        present(emailMessageVC, animated: true, completion: nil)
    }
    
    /// <#Description#>
    ///
    /// - parameter message: <#message description#>
    func sendSMSWith(message: String){
        
        let smsMessageVC = messageObject.sendMessageWith(bodyText: message)
        present(smsMessageVC, animated: true, completion: nil)
    }
    
    //MARK: - Custom Functions
    
    /// Generates a new project code name and sets the appropriate UI elements including background color.
    func generateNewProjectCode(){
        
        
        let newCodeName = CodeName()
        lblCodeName.text = newCodeName.codeNameString
        
        let bgColor = UIColor.randomFlatColor()
        
        view.backgroundColor = bgColor
        lblCodeName.textColor = UIColor.contrastColor(color: bgColor)
        
        if lblCodeName.textColor == UIColor.black{
            lblCodeName.shadowColor = UIColor.lightGray}
        else{
            lblCodeName.shadowColor = UIColor.black
        }
    }
    
    func updateAppVersionLabel(){
        
        lblVersion.text = AppController.sharedInstance.appVersion() + " (\(AppController.sharedInstance.appBuildNumber()))"
    }
    
    
    //MARK: - Storyboard Navigation Methods
    
}
