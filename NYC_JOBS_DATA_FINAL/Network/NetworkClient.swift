//
//  NetworkClient.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 5/28/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation

enum NetworkResponse {
    case success(Data)
    case error(Error?)
}

struct NetworkClient {
    
    static func get(with url: URL, completion: @escaping ((NetworkResponse) -> Void)) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                
                completion(.error(error ?? nil))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
