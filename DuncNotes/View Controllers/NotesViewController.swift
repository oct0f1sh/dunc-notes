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
    
    @IBAction func unwindToNotes(_ unwindSegue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getNotes()
    }
    
    func setupView() {
        // Set Navigation bar font and size
        let attributes = [NSAttributedString.Key.font: UIFont(name: "SofiaProLight", size: 20)!]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    func getNotes() {
        NoteService.getNotes() { notes in
            self.notes = notes
        }
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNote" {
            let destination: NoteViewController = segue.destination as! NoteViewController
            destination.note = self.notes[(tableView.indexPathForSelectedRow?.row)!]
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showNote", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle ==  .delete {
            let note = notes[indexPath.row]
            
            NoteService.removeNote(note: note) {
                getNotes()
            }
        }
    }
}
