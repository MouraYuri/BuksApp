//
//  MainTableViewCell.swift
//  Buks App
//
//  Created by Carlos on 18/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var clCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
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

//extension MainTableViewCell {
//    func setCollectionViewDataSourceDelegate <D:UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate: D, forRow row:Int){
//        
//        clCollectionView.delegate = dataSourceDelegate
//        clCollectionView.dataSource = dataSourceDelegate
//        
//        clCollectionView.reloadData()
//    }
//}

