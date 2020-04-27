//
//  Constructor.swift
//  PageViewController2
//
//  Created by aluno on 16/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit


struct Constructor {
    
    
    static let main = Constructor()
    
    var window: UIWindow?
    let userDefaults = UserDefaults.standard
    
    init() {
        if userDefaults.value(forKey: "IS_FIRST_TIME") as? Bool != nil {
            print("not first usage")
            let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
            window = UIWindow(frame: UIScreen.main.bounds)
            let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        } else {
            print("first usage")
            let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PageViewController")
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
            userDefaults.setValue(true, forKey: "IS_FIRST_TIME")
            userDefaults.synchronize()
        }
    }
}

