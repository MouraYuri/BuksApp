//
//  SearchBarViewController.swift
//  Buks App
//
//  Created by Carlos on 20/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController {
    
    
     var arrayBooks = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBooks()

    }
    
    @IBOutlet weak var tableViewSearchBook: UITableView!
    @IBOutlet weak var BookName: UITextField!
    
    func fetchBooks() {
        
        ServiceUser.getBooksAPI{ (books, error) in
            if let err = error {
                print(err)
            }
            
            guard let result_books = books else {
                return print("error fetchBooks")
            }

            self.arrayBooks = result_books
           
        
            DispatchQueue.main.async {
                self.tableViewSearchBook.reloadData()
            }
        }
    }
    
}

extension SearchBarViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = arrayBooks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchBookCell") as!
        SearchTableViewCell
        
        guard let image_book = book.thumbnail else {
            return cell
        }
        
        let url = URL(string: image_book)
        
        guard let myUrl = url else {
            return cell
        }
        
        ServiceUser.shared.getData(from: myUrl) { (data, urlResponse, error) in
            guard let data = data, let image = UIImage(data: data) else {
                return print("Cant load data")
            }
            
            DispatchQueue.main.async {
                cell.imageCell?.image = image
                cell.textAuthorOfBook?.text = book.author
                cell.textTitleOfBook?.text = book.title
                cell.layoutSubviews()
            }
       
        }
         return cell
    }
    
    
}
