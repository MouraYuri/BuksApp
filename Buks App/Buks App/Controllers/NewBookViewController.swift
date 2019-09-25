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
   
    
    var buksArray = [BukResult]()
    var books = [Book]()
    var filteredBook = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // retrievingData()
        tableNewBooks.reloadData()
    }

    @IBOutlet weak var searchNewBook: UISearchBar!
    
    @IBOutlet weak var tableNewBooks: UITableView!
    
    
//    //books create
//    func createBooks(books: Array<BukResult>) -> [Book] {
//        var newArrayBook = [Book]()
//
//        newArrayBook = books.map({ book -> Book in
//            let newBook = Book(titulo: book.title,
//                               description: book.description ?? "No Description",
//                               autor: book.author, id_dono: "01",
//                               image: UIImage(named: "livro")!,
//                               history_ID_rent: ["02"],
//                               status: true,
//                               estado: "novo")
//            print(newBook)
//            return newBook
//        })
//
//        return newArrayBook
// }
//    // API CONSUME
//    func retrievingData() {
//
//        //URLSession its like a browser tab and you
//        //can do tasks, like downloading a JSON an api.
//        // you can have more than one task
//
//        Service<Buk>().get(urlString: Route.best_sellers) { (buk, error) in //receiving the escaping closure
//            if let err = error {
//                print(err.localizedDescription)
//            }
//
//             print(buk?.results)
//
//            guard let bukk = buk?.results else{
//                return print("dasd")
//            }
//
//            DispatchQueue.main.async {
//                self.buksArray = bukk
//                self.books = self.createBooks(books: self.buksArray)
//
//                self.filteredBook = self.books
//
//                self.tableNewBooks.reloadData()
//            }
//
//        }
//    }

}

extension NewBookViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBook.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notesTitles = filteredBook[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNewBook", for: indexPath)
        
    cell.textLabel?.text = "teste"
        return cell
    }
    
    
}


extension NewBookViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredBook = books.filter{
//            $0.titulo.prefix(searchText.count) == searchText
//        }
        
        tableNewBooks.reloadData()
    }
    
}
