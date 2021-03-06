//
//  AllJobsModelController.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 5/28/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation
import ReactiveSwift

class AllJobsModelController {
    
    var data: [Job] = []
    var state: MutableProperty<State<[Job]>>
    
    init() {
        state = MutableProperty(.initial)
    }
    
    func refreshData(withSearchTerm term: String? = nil) {
        
        var urlString = "https://data.cityofnewyork.us/resource/swhp-yxa4.json"
        
        if let term = term {
            urlString = urlString + "?$q=\(term)".addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        }
        
        let url = URL(string: urlString)!
        
        state.value = .updating
        
        NetworkClient.get(with: url) { [weak self] (response) in
            
            guard let `self` = self else { return }
            
            switch response {
            case .success(let data):
                
                do {
                    
                    let decodedData = try JSONDecoder().decode([Job].self, from: data)
                    self.data = decodedData
                    self.state.value = .didUpdate(decodedData)
                } catch let error {
                    
                    print(error.localizedDescription)
                    self.state.value = .didFailToUpdate
                }
                
            case .error:
                self.state.value = .didFailToUpdate
            }
        }
    }
}
