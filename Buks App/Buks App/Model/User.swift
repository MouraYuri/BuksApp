//
//  User.swift
//  Buks App
//
//  Created by Carlos on 19/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import Foundation

struct User: Decodable {
    let uid: Int
    let name: String
    let email: String
    let password: String
    let books: [Book]
}
struct UserComents: Decodable{
    let ID:String
    let Titulo:String
    let Nome:String
    let Comentario:String
}
