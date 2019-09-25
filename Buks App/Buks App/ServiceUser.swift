//
//  Service.swift
//  FirstProject
//
//  Created by aluno on 05/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class ServiceUser {
    
    static func getUsers(completion: @escaping ([User]?, Error?) -> Void) {
        let urlString = "https://itchy-goat-48.localtunnel.me/users"
        
        guard let url = URL(string: urlString) else {return}
        
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            if let err = error {
                completion(nil, err)
            }
            
            do {
                let posts = try JSONDecoder().decode([User].self, from: data)
                completion(posts, nil)
            } catch let err {
                completion(nil, err)
            }
            }.resume()
        
        
    }
    
    
    static func getBooks(completion: @escaping ([Book]?, Error?) -> Void) {
        let urlString = "https://adams.localtunnel.me/books/"
        
        guard let url = URL(string: urlString) else {return}
        
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            if let err = error {
                completion(nil, err)
            }
            
            do {
                let posts = try JSONDecoder().decode([Book].self, from: data)
                completion(posts, nil)
            } catch let err {
                completion(nil, err)
            }
            }.resume()
        
        
    }
}
