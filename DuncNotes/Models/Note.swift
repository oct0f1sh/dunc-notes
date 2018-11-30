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
    var uid: String?
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    init(title: String, content: String, uid: String) {
        self.title = title
        self.content = content
        self.uid = uid
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case content
    }
    
    init?(from snapshot: DataSnapshot) {
        let note = snapshot.value as! [String: Any]
        self.title = note["title"] as! String
        self.content = note["content"] as! String
        self.uid = snapshot.key
    }
    
    func asDict() -> [String: Any] {
        return ["title": self.title,
                "content": self.content]
    }
}
