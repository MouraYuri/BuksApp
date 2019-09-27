//
//  Book.swift
//  Buks App
//
//  Created by Carlos on 19/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import Foundation
import UIKit

struct Book: Decodable {
    let title:String
    let description:String
    let author:String
    let owner_id:Int
    let thumbnail:String?
    let history_id:[String]
    let status:String
}
