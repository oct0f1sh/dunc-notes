//
//  NoteViewController.swift
//  DuncNotes
//
//  Created by Duncan MacDonald on 11/29/18.
//  Copyright © 2018 Duncan MacDonald. All rights reserved.
//

import Foundation
import UIKit

class NoteViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    var note: Note?
    
    override func viewDidLoad() {
        setupView()
    }
    
    func setupView() {
        // style text view
        contentTextView.layer.borderWidth = 1
        contentTextView.layer.borderColor = UIColor(red: 0.78, green: 0.78, blue: 0.80, alpha: 1).cgColor // default placeholder color
        contentTextView.layer.cornerRadius = 5
        
        // style save button
        saveButton.layer.cornerRadius = 5
        
        // set labels to note contents
        if let note = self.note {   // if editing existing note
            titleTextField.text = note.title
            contentTextView.text = note.content
        } else {
            contentTextView.text = ""
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        // save note contents / update existing note
        if let title = titleTextField.text,
            let content = contentTextView.text {
            
            if title == "" || content == "" {
                return
            }
            
            if let note = self.note { // modifying existing note
                note.title = title
                note.content = content
            } else {
                self.note = Note(title: title, content: content)
            }
            
            NoteService.saveNote(note: self.note!) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
