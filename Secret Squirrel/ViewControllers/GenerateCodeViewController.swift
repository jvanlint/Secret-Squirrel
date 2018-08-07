//
//  GenerateCodeViewController.swift
//  CodeNameGenerator
//
//  Created by Jason van Lint on 12/09/2016.
//  Copyright © 2016 Dead Frog Studios. All rights reserved.
//

import UIKit
import MessageUI                                        // Framework to enable eMail and SMS. Requires delegates for email
                                                        // and SMS to specified after class declaration.

class GenerateCodeViewController: UIViewController {
    
    // MARK: - Instance Variables
    let messageObject = MessageComposer()               // Instance of MessageComposer declared at a scope that can be seen
                                                        // throughout the lifetime of the View Controller
                                                        // (so that the delegate callback can be invoked when appropriate).
    
    var timer: Timer!                                   // Timer variable used to animate squirrel image at given intervals.
    
    // MARK: - IBOutlets
    @IBOutlet weak var lblCodeName: UILabel!            // Label displaying the generated code name
    @IBOutlet weak var lblVersion: UILabel!             // App version label
    @IBOutlet weak var lblProject: UILabel!             // Label displaying the text Project or Operation
    @IBOutlet weak var btnProject: WireFrameButton!     // The button switching between Project and Operation
    @IBOutlet weak var squirrelImage: UIImageView!      // Squirrel image used for animation.
    @IBOutlet weak var bgView: UIView!                  // Background view object used for changing color of the interface.
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
       
        //Update the version number string.
        updateAppVersionLabel()
        
        // Setup a timer to animate the squirrel image.
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block:{_ in self.shakeSquirrel() })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Everytime the view appears call the function that generates the code.
        generateNewProjectCode()
    }
    
    // MARK: - User Interaction Functions
    
    @IBAction func didTouchGenerateButton(_ sender: AnyObject) {
        
        // Call the function that generates the code.
        generateNewProjectCode()
    }
    
    
    /// Launches a dialog box asking if an Message or email is to be sent and calls appropriate messaging function.
    ///
    /// - Parameter sender: The navbar button touched.
    @IBAction func didTouchMessagingButton(_ sender: UIBarButtonItem) {
        
        // Generate the message text to be sent to either email or iMessage.
        let projectText = lblProject.text!
        let codenameText = lblCodeName.text!
        
        let subjectText = "A Secret Squirrel generated code name has been selected!"
        let messageText = "The \(projectText) should now be referred to as: \(projectText) \(codenameText)"
        
        // Set up the UIAlertController.
        
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
        
        // Get the new text required for the label and button.
        let newLabelText = (lblProject.text == "PROJECT" ? "OPERATION" : "PROJECT")
        let newButtonText = "It's a " + newLabelText.capitalized
        
        // Set label and button text appropriately.
        lblProject.text = newLabelText
        btnProject.setTitle(newButtonText, for: .normal)
        
        // Generate a new code.
        generateNewProjectCode()
        
        // Fade in the newly changed label text.
        lblProject.fadeIn()
    }
    
    // MARK: - Messaging Functions
    
    /// Launches iOS email with specified message and subject.
    ///
    /// - parameter message: The message that you want displayed in the email body.
    /// - parameter subject: The email subject text.
    func sendEmailWith(message: String, subject: String) {
        
        let emailMessageVC = messageObject.sendEmailWith(bodyText: message, subjectText: subject)//
        present(emailMessageVC, animated: true, completion: nil)
    }
    
    /// Launches the iOS messaging app with specified message,
    ///
    /// - parameter message: The message to appear in the input field when the Message app launches.
    func sendSMSWith(message: String){
        
        let smsMessageVC = messageObject.sendMessageWith(bodyText: message)
        present(smsMessageVC, animated: true, completion: nil)
    }
    
    // MARK: - Custom Functions
    
    /// Generates a new project code name and sets the appropriate UI elements including background color.
    func generateNewProjectCode(){
        
        // Obtain a new project code by creating a CodeName object. The initialiser of the class will generate the code.
        let newCodeName = CodeName()
        
        // Set the code name label to a nicely formatted code name string provided by the object.
        lblCodeName.text = newCodeName.codeNameString
        
        // Change the background color to signify new code generated and to make the UI bootylicious.
        let currentColor = self.view.backgroundColor
        var newBgColor = UIColor.randomFlatColor()
        while (currentColor == newBgColor) {
            newBgColor = UIColor.randomFlatColor()
        }
        
        // Animate the transition between the current color and the newly generated random color.
        //self.bgView.fadeColor(toColor: newBgColor, duration: 0.25, delay: 0, completion: nil)
        self.view.fadeColor(toColor: newBgColor, duration: 0.25, delay: 0, completion: nil)

        // Change the label to white or black depending on the contrast of the background color.
        lblCodeName.textColor = UIColor.contrastColor(color: newBgColor)
        
        // Change the shadow color based on the color of the text.
        lblCodeName.shadowColor = (lblCodeName.textColor == UIColor.black ? UIColor.lightGray : UIColor.black)
        
        // Animate the Code Name label
        lblCodeName.popIn()
    }
    
    
    /// Upodates the label containing the version information. Gets version information via the app controller singleton.
    func updateAppVersionLabel(){
        
        lblVersion.text = AppController.sharedInstance.appVersion() + " (\(AppController.sharedInstance.appBuildNumber()))"
    }
    
    
    /// Animates squirrel image view by shaking it. Called via a timer function.
    func shakeSquirrel(){
        squirrelImage.shake()
    }
}
