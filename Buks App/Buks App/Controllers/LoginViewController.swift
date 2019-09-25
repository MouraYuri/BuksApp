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
    
    var usersArray = [User]()
    
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
        retrievingData()
    }
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passInput: UITextField!
    @IBAction func emailLogin(_ sender: UIButton) {
        verificaLogin(username: usernameInput.text, pass:passInput.text)
    }
    
    @IBOutlet weak var createAccount: UIButton!
    @IBOutlet weak var googleLogin: UIButton!
    @IBOutlet weak var facebookLogin: UIButton!
    
    
    
    func retrievingData() {
        
        ServiceUser.getUsers{(users, error) in
            if let err = error {
                print(err)
            }
            print(users)
            self.usersArray = users!
        }
        
    }
    
    func verificaLogin(username:String?,pass:String?){
        usersArray.forEach { user in
            if((user.name == username) && (user.password == pass)){
                print(user.books)
                performSegue(withIdentifier: "login", sender: self)
                
            }
//            }else{
//                let alert = UIAlertController(title: "Erro", message: "Username or pass was wrong", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
//                self.present(alert,animated: true)
//            }
        }
    }
}






