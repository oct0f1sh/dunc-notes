//
//  Note.swift
//  DuncNotes
//
//  Created by Duncan MacDonald on 11/29/18.
//  Copyright © 2018 Duncan MacDonald. All rights reserved.
//

import Foundation
import Firebase

class Note {
    var title: String
    var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case content
    }
    
    init(from snapshot: DataSnapshot) {
        let note = snapshot.value as! [String: Any]
        self.title = note["title"] as! String
        self.content = note["content"] as! String
    }
}
