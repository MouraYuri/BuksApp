//
//  BookViewController.swift
//  Buks App
//
//  Created by Carlos on 23/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import Foundation
import UIKit

class BookViewController:UIViewController{
    
    let cellId = "reviewsCell"
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
}

extension BookViewController: UITableViewDelegate, UITableViewDataSource {
    
    override func awakeFromNib() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ReviewsBookTableViewCell 
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
