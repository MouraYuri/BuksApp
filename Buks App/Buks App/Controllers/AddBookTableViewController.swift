//
//  AddBookTableViewController.swift
//  Buks App
//
//  Created by Carlos on 23/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import UIKit

class AddBookTableViewController: UIViewController {

    @IBAction func goAddButton(_ sender: Any) {
        performSegue(withIdentifier: "segueAddBook", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


extension AddBookTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellItemBook", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
