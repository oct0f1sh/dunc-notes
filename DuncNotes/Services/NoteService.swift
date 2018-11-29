//
//  NotesService.swift
//  DuncNotes
//
//  Created by Duncan MacDonald on 11/29/18.
//  Copyright © 2018 Duncan MacDonald. All rights reserved.
//

import Foundation
import Firebase

class NoteService {
    static func getNotes(completion: @escaping ([Note]) -> Void) {
        let uid = Auth.auth().currentUser?.uid
        
        let ref = DatabaseReference.toLocation.user(uid: uid!).dbReference()
        
        ref
    }
}
