//
//  AuthenticationService.swift
//  DuncNotes
//
//  Created by Duncan MacDonald on 11/29/18.
//  Copyright © 2018 Duncan MacDonald. All rights reserved.
//

import Foundation
import Firebase

class AuthenticationService {
    static func loginUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        // Authenticate Firebase user with email/password
        Auth.auth().signIn(withEmail: email, password: password) { (_, err) in
            
            // Warn user on error
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        }
    }
    
    static func signUpUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        // Try to sign in Firebase user with email/password
        Auth.auth().createUser(withEmail: email, password: password) { (_, err) in
            
            // Warn user on error
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        }
    }
}
