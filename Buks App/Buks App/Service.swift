//
//  Service.swift
//  programaticamente
//
//  Created by aluno on 13/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//
import Foundation


class Service<T: Decodable> {
    
    func get(urlString: String, completion: @escaping (T?, Error?) -> Void) { //sending the escaping closure
        
        guard let url = URL(string: urlString) else {return print("Invalid URL")} //Parsing a string to a URL
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let erro = error {
                return print("Error exits \(erro.localizedDescription)")
            }
            
            guard let data = data else {return print("Date dont load")}
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result, nil) //send the result with completion because there is no error
            } catch {
                print("NAO CONSEGUIR DECODAR")
                completion(nil, error) //send the error because something went wrong when the service tried to get
            }
            
            }.resume()
    }
    
}
