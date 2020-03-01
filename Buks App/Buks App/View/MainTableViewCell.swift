//
//  MainTableViewCell.swift
//  Buks App
//
//  Created by Carlos on 18/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import UIKit

protocol MainTableViewCellDelegate: class {
    func didSelectBook(_ book: Book)
}

class MainTableViewCell: UITableViewCell {
    
    
    weak var cellDelegate: MainTableViewCellDelegate?
    
    var parentController: UIViewController?
    
    @IBOutlet weak var clCollectionView: UICollectionView!
    
    var arrayBooks: [Book] = [] {
        didSet {
            clCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clCollectionView.delegate = self
        clCollectionView.dataSource = self
    }
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 15.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
    }
    
}

extension MainTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let book = arrayBooks[indexPath.row]
//        delegate?.senderBook(book: book)
        cellDelegate?.didSelectBook(book)
    }
    
    //collection view delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InsideCollectionViewCell", for: indexPath) as! InsideCollectionViewCell
        
        guard let image_book = arrayBooks[indexPath.row].thumbnail else {
            return cell
        }
        
        
        let url = URL(string: image_book)
        ServiceUser.shared.getData(from: url!) { (data, urlResponse, error) in
            guard let data = data, let image = UIImage(data: data) else {
                return print("Cant load data")
            }
            
            DispatchQueue.main.async {
                cell.imageCell.image = image
                cell.layoutSubviews()
            }
            
        }
        
        
        collectionView.showsHorizontalScrollIndicator = false
        return cell
    }
    
}


//extension MainTableViewCell {
//    func setCollectionViewDataSourceDelegate <D:UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate: D, forRow row:Int){
//        
//        clCollectionView.delegate = dataSourceDelegate
//        clCollectionView.dataSource = dataSourceDelegate
//        
//        clCollectionView.reloadData()
//    }
//}

