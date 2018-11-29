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
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        print("initialized view controller")
    }
    
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
                }
            }
            
        case 1: // Sign Up Button Tapped
            print("Sign up user")
            
            AuthenticationService.signUpUser(email: emailTextField.text!, password: passwordTextField.text!) { (err) in
                if let err = err {
                    // Show alert containingn error message
                    self.showAlert(title: "Error", message: err.localizedDescription, actionText: "Ok")
                } else {
                    print("Successfully signed up")
                }
            }
            
        default:
            print("Invalid button tag")
        }
    }
}
