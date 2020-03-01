//
//  HomeViewController.swift
//  Buks App
//
//  Created by Carlos on 17/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import Foundation
import UIKit


class HomeViewController:UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var searchController = UIStoryboard(name: "Main", bundle: nil)
        .instantiateViewController(withIdentifier: "SearchBarViewController") as! SearchBarViewController
    
    var arrayBooks = [[Book]]()
    
    var data = [TableSection: [String: Any]]()
    
    enum TableSection: Int {
        case adventure = 0, romantic,
        scifi, action, horror, family,
        kids, animation, criminal, more
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
         fetchBooks()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
       
        
    }
    
    func configureTableView() {
        tableView.allowsSelection = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var Search: UISearchBar!
    //delegate de collection
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = PaddingLabel()
        switch section {
            case 0:
                label.text = "Adventure"
                label.backgroundColor = .white
                label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                
                return label
            case 1:
                label.text = "Romantic"
                label.backgroundColor = .white
                label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                return label
            case 2:
                label.text = "Sci-fi"
                label.backgroundColor = .white
                label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                return label
            case 3:
                label.text = "Action"
                label.backgroundColor = .white
                label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                return label
            case 4:
                label.text = "Horror"
                label.backgroundColor = .white
                label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                return label
            case 5:
                label.text = "Family"
                label.backgroundColor = .white
                label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                return label
            case 6:
                label.text = "Kids"
                label.backgroundColor = .white
                label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                return label
            case 7:
                label.text = "Animation"
                label.backgroundColor = .white
                label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                return label
            case 8:
                label.text = "Criminal"
                label.backgroundColor = .white
                label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                return label
            default:
                label.text = "More"
                return label
                
        }
    }
    
    func createDirectioryFileManager() {
        //create directory
        let documentsPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        let logsPath = documentsPath.appendingPathComponent("books")
        print(logsPath!)
        
        do{
            try FileManager.default.createDirectory(atPath: logsPath!.path, withIntermediateDirectories: true, attributes: nil)
            
        }catch let error as NSError{
            print("Unable to create directory",error)
        }
    }
    
    
    
    // table view delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 250
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        
        cell.cellDelegate = self
        
        if !arrayBooks.isEmpty {
            cell.arrayBooks = arrayBooks[indexPath.section]
        }
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCellCollectionView" {
            let controller = segue.destination as! BookViewController
            controller.book = sender as? Book
        }
    }
    
    
    func fetchBooks() {
        
        ServiceUser.getBooks{ (books, error) in
            if let err = error {
                print(err)
            }
            
            guard let result_books = books else {
                return print("error fetchBooks()")
            }
            
            self.arrayBooks = []
            
            for _ in 0...8 {
                self.arrayBooks.append(result_books)
            }
            
            print(self.arrayBooks)
            DispatchQueue.main.async {
                    self.tableView.reloadData()
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
   
    
}
//
//extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       // let bookChoice = books[indexPath.row]
//        ///print(bookChoice)
//    }
//    //collection view delegate
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InsideCollectionViewCell", for: indexPath) as! InsideCollectionViewCell
//        guard let image_book = arrayBooks[indexPath.row].thumbnail else {
//            return cell
//        }
//
//        print("\n\n\n"+image_book)
//        let url = URL(string: image_book)
//        ServiceUser.shared.getData(from: url!) { (data, urlResponse, error) in
//            guard let image = UIImage(data: data!) else {
//                return print("Cant load data")
//            }
//
//            DispatchQueue.main.async {
//                cell.imageCell.image = image
//            }
//
//        }
//
//
//        collectionView.showsHorizontalScrollIndicator = false
//        return cell
//    }
//
//}


extension HomeViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        performSegue(withIdentifier: "bookteste", sender: self)
        searchBar.setShowsCancelButton(false, animated: true)
        return false
    }
}

extension HomeViewController: MainTableViewCellDelegate {
    func didSelectBook(_ book: Book) {
        performSegue(withIdentifier: "segueCellCollectionView", sender: book)
    }
}



