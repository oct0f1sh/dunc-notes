//
//  DatabaseReference+Location.swift
//  DuncNotes
//
//  Created by Duncan MacDonald on 11/29/18.
//  Copyright © 2018 Duncan MacDonald. All rights reserved.
//

import Foundation
import Firebase

extension DatabaseReference {
    enum DbLocation {
        case root
        case users
        case user(uid: String)
        case notes(userUid: String)
        
        func dbReference() -> DatabaseReference {
            let root = Database.database().reference()
            
            switch self {
            case .root:
                return root
            case .users:
                return root.child("users")
            case .user(let uid):
                return root.child("users").child(uid)
            case .notes(let userUid):
                return root.child("users").child(userUid).child("notes")
            }
        }
    }
    
    static func toLocation(_ location: DbLocation) -> DatabaseReference {
        return location.dbReference()
    }
}
