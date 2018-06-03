//
//  AllJobsViewModel.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 5/28/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation
import ReactiveSwift

final class AllJobsViewModel {
    
    var state: MutableProperty<State<[Job]>>
    
    var jobs: [Job] {
        return jobsModelController.data
    }
    
    private let jobsModelController = AllJobsModelController()
    
    init() {
        self.state = MutableProperty(.initial)
        setUp()
    }
    
    private func setUp() {
        jobsModelController.refreshData()
        
        jobsModelController.state.signal.observeValues { [weak self] (newState) in
            
            guard let `self` = self else { return }
            
            switch newState {
            case .initial: break
            case .updating: self.state.value = .updating
            case .didUpdate(let jobs): self.state.value = .didUpdate(jobs)
            case .didFailToUpdate: self.state.value = .didFailToUpdate
            }
        }
    }
}
