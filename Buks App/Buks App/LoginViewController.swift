//
//  LoginViewController.swift
//  Buks App
//
//  Created by Carlos on 16/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import Foundation
import UIKit


class LoginViewController:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleLogin.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        googleLogin.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        googleLogin.layer.shadowOpacity = 0.5
        googleLogin.layer.shadowRadius = 5.0
        googleLogin.layer.masksToBounds = false
        googleLogin.layer.cornerRadius = 20.0
        
        
        facebookLogin.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        facebookLogin.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        facebookLogin.layer.shadowOpacity = 1.0
        facebookLogin.layer.shadowRadius = 20.0
        facebookLogin.layer.masksToBounds = false
        facebookLogin.layer.cornerRadius = 20.0
        
        
        createAccount.layer.borderColor = #colorLiteral(red: 0.3490196078, green: 0.6980392157, blue: 0.8980392157, alpha: 1)
        createAccount.layer.borderWidth = 5
    }
    
    @IBOutlet weak var createAccount: UIButton!
    
    @IBOutlet weak var googleLogin: UIButton!
    
    @IBOutlet weak var facebookLogin: UIButton!
}
