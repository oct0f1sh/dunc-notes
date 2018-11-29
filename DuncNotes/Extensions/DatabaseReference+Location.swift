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
    enum toLocation {
        case root
        case user
        
        func dbReference() -> DatabaseReference {
            let root = Database.database().reference()
            
            switch self {
            case .root:
                return root
            case .user:
                return root.child("user")
            }
        }
    }
}
