//
//  LoginViewController.swift
//  DuncNotes
//
//  Created by Duncan MacDonald on 11/29/18.
//  Copyright © 2018 Duncan MacDonald. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    // OUTLETS AND UNWIND SEGUES
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
        // clear text fields
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    // OVERRIDE FUNCTIONS
    
    override func viewDidLoad() {
        print("initialized view controller")
    }
    
    // IBACTIONS
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0: // Login Button Tapped
            print("log in user")
            
            AuthenticationService.loginUser(email: emailTextField.text!, password: passwordTextField.text!) { (err) in
                if let err = err {
                    // Show alert containing error message
                    self.showAlert(title: "Error", message: err.localizedDescription, actionText: "Ok")
                } else {
                    print("Successfully logged in")
                    self.performSegue(withIdentifier: "showNotes", sender: self)
                }
            }
            
        case 1: // Sign Up Button Tapped
            print("Sign up user")
            
            AuthenticationService.signUpUser(email: emailTextField.text!, password: passwordTextField.text!) { (err) in
                if let err = err {
                    // Show alert containingn error message
                    self.showAlert(title: "Error", message: err.localizedDescription, actionText: "Ok")
                } else {
                    self.performSegue(withIdentifier: "showNotes", sender: self)
                }
            }
            
        default:
            print("Invalid button tag")
        }
    }
}
