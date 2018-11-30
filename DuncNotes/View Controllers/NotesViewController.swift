//
//  ViewController.swift
//  DuncNotes
//
//  Created by Duncan MacDonald on 11/28/18.
//  Copyright © 2018 Duncan MacDonald. All rights reserved.
//

import UIKit
import Firebase

class NotesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var notes: [Note] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        NoteService.getNotes() { notes in
            self.notes = notes
        }
    }
    
    func setupView() {
        // Set Navigation bar font and size
        let attributes = [NSAttributedString.Key.font: UIFont(name: "SofiaProLight", size: 20)!]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
    }

    @IBAction func logoutTapped(_ sender: Any) {
        AuthenticationService.signOutUser { (err) in
            if let err = err {
                self.showAlert(title: "Error", message: err.localizedDescription, actionText: "Ok")
            } else {
                self.performSegue(withIdentifier: "showLogin", sender: self)
            }
        }
    }
    
    @IBAction func newNoteTapped(_ sender: Any) {
        NoteService.saveNote(note: Note(title: "new note", content: "this is my cool new note")) { (err) in
            print("OH GOD OH NO \(err?.localizedDescription)")
        }
    }
    
}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NoteCellView = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! NoteCellView
        
        cell.noteTitleLabel.text = self.notes[indexPath.row].title
        
        return cell
    }
}

extension NotesViewController: UITableViewDelegate {
    
}
