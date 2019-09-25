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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
