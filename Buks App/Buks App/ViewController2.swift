//
//  ViewController2.swift
//  Buks App
//
//  Created by Carlos on 13/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import Foundation
import UIKit

class ViewController2: UIViewController{
    override func viewDidLoad() {
         super.viewDidLoad()
    }
    
    @IBAction func Test(_ sender: UIButton) {
        let pageViewController = self.parent as! PageViewController
        pageViewController.nextPageWithIndex(index: 2)
    }
    
    
}

