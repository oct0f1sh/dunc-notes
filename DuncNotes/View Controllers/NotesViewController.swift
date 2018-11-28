//
//  ViewController.swift
//  DuncNotes
//
//  Created by Duncan MacDonald on 11/28/18.
//  Copyright © 2018 Duncan MacDonald. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {

        // Set Navigation bar font and size
        let attributes = [NSAttributedString.Key.font: UIFont(name: "SofiaProLight", size: 20)!]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
    }


}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NoteCellView = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! NoteCellView
        
        cell.noteTitle = "Note \(indexPath.row)"
        
        return cell
    }
}

extension NotesViewController: UITableViewDelegate {
    
}
