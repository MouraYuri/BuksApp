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
        label.backgroundColor = .white
        label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        switch section {
            case 0:
                label.text = "Adventure"
                return label
            case 1:
                label.text = "Romantic"
                return label
            case 2:
                label.text = "Sci-fi"
                return label
            case 3:
                label.text = "Action"
                return label
            case 4:
                label.text = "Horror"
                return label
            case 5:
                label.text = "Family"
                return label
            case 6:
                label.text = "Kids"
                return label
            case 7:
                label.text = "Animation"
                return label
            case 8:
                label.text = "Criminal"
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



