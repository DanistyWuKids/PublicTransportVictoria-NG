//
//  AboutViewController.swift
//  Oh_My-Transport
//
//  Created by OriWuKids on 26/4/19.
//  Copyright © 2019 wgon0001. All rights reserved.
//

import UIKit
import MessageUI

class AboutViewController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var apiKeyTextField: UITextField!
    
    @IBAction func updateKey(_ sender: Any) {
        _ = userIdTextField.text
        _ = apiKeyTextField.text
    }
    
    @IBAction func sendMail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail(){
            let controller = MFMailComposeViewController()
            controller.mailComposeDelegate = self
            controller.setSubject("PTV Timetable API – request for key")
            controller.setToRecipients(["APIKeyRequest@ptv.vic.gov.au"])
            
            controller.setMessageBody("", isHTML: false)
            
            self.present(controller, animated: true, completion: nil)
        }else{
            print("Sending Mail Failed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    
    
    private func mailComposeController(controller: MFMailComposeViewController,
                               didFinishWithResult result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
        switch result.rawValue{
        case MFMailComposeResult.sent.rawValue:
            print("Mail has been sent")
        case MFMailComposeResult.cancelled.rawValue:
            print("User has abort the action")
        case MFMailComposeResult.saved.rawValue:
            print("Mail has been saved")
        case MFMailComposeResult.failed.rawValue:
            print("Mail Sent failed")
        default:
            print("Mail did not send")
            break
        }
    }

    // Update the data to NSUserDefaults
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
