//
//  ViewController.swift
//  Buks App
//
//  Created by Carlos on 12/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Click(_ sender: Any) {
        let pageViewController = self.parent as! PageViewController
        pageViewController.nextPageWithIndex(index: 1)
    }
    
    @IBOutlet weak var SkipButton: UIButton!
    
    
    @IBAction func NextButton(_ sender: Any) {
        let pageViewController = self.parent as! PageViewController
        pageViewController.nextPageWithIndex(index: 1)
    }
    
}

