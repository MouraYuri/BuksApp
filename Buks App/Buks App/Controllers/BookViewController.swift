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
    
    
    @IBOutlet weak var imageViewBook: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var authorText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    
    var book: Book?
    
    let cellId = "reviewsCell"
    override func viewDidLoad() {
        super.viewDidLoad()
    
        descriptionText.text =  book?.description
        authorText.text = book?.author
        titleText.text = book?.title
    
        guard let thumbnail = book?.thumbnail else {
            return print("image error")
        }
        let url = URL(string: thumbnail)
        ServiceUser.shared.getData(from: url!) { (data, urlResponse, error) in
            guard let data = data, let image = UIImage(data: data) else {
                return print("Cant load data")
            }
            
            DispatchQueue.main.async {
                self.imageViewBook.image = image
            }
            
        }
      
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
