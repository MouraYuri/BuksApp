//
//  Book.swift
//  Buks App
//
//  Created by Carlos on 19/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import Foundation


struct Buk: Decodable {
    let results: [BukResult]?
    enum BukKeys: String, CodingKey {
        case results = "results"
    }
}

struct BukResult: Decodable {
    let title: String
    let description: String?
    let author: String
}


enum Route {
    
    static var best_sellers: String{
        return "https://api.nytimes.com/svc/books/v3/lists/best-sellers.json?&api-key=Zb1nP6AQFHLwVFSutOFSSpOxZCTp8QkJ"
    }
    
    static var romance: String{
        return "https://api.nytimes.com/svc/books/v3/lists/current/romance.json?&api-key=Zb1nP6AQFHLwVFSutOFSSpOxZCTp8QkJ"
    }
    
    static var adventure: String{
        return "https://api.nytimes.com/svc/books/v3/lists/current/adventure.json?&api-key=Zb1nP6AQFHLwVFSutOFSSpOxZCTp8QkJ"
    }
}
