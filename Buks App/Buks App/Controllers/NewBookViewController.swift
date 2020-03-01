//
//  NewBookViewController.swift
//  Buks App
//
//  Created by Carlos on 23/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import Foundation
import UIKit

class NewBookViewController:UIViewController{
   
    
    @IBOutlet weak var tableView: UITableView!
    var arrayBooks = [Book]()
    var filteredBook = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBooks()
    }

    @IBOutlet weak var searchNewBook: UISearchBar!
    
    @IBOutlet weak var tableNewBooks: UITableView!
    
    func fetchBooks() {
        
        ServiceUser.getBooksAPI{ (books, error) in
            if let err = error {
                print(err)
            }
            
            guard let result_books = books else {
                return print("error fetchBooks")
            }
            
            self.arrayBooks = result_books
            self.filteredBook = self.arrayBooks
            
            print(self.arrayBooks)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}



extension NewBookViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBook.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notesTitles = filteredBook[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNewBook", for: indexPath)
        
    cell.textLabel?.text = notesTitles.title
        return cell
    }
    
    
}


extension NewBookViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredBook = arrayBooks.filter{
            $0.title.prefix(searchText.count) == searchText
        }
        
        tableNewBooks.reloadData()
    }
    
}
