//
//  Service.swift
//  FirstProject
//
//  Created by aluno on 05/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class ServiceUser {
    
    
    static let shared =  ServiceUser()
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    
    static func getUsers(completion: @escaping ([User]?, Error?) -> Void) {
        let urlString = "https://adams.localtunnel.me/users"
        
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
            guard let data = data else {
                completion(nil, error)
                return
            }
            
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
    
    static func getBooksAPI(completion: @escaping ([Book]?, Error?) -> Void) {
        let urlString = "https://adams.localtunnel.me/booksAPI/"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            
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
