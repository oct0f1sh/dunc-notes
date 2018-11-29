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
        
        let ref = DatabaseReference.toLocation(.notes(userUid: uid!))
        
        print(ref.description())
        
        var notes = [Note]()
        
        ref.observeSingleEvent(of: .value) { (snapshot) in
            for child in snapshot.children {
                if let snap = child as? DataSnapshot,
                    let note = Note(from: snap) {
                    notes.append(note)
                }
            }
            completion(notes)
        }
    }
    
    static func saveNote(note: Note, completion: @escaping (Error?) -> Void) {
        let uid = Auth.auth().currentUser?.uid
        
        let ref = DatabaseReference.toLocation(.notes(userUid: uid!)).childByAutoId()
        
        ref.setValue(note.asDict())
    }
}
