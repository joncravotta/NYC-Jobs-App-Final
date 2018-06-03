//
//  JobViewModel.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 6/2/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation

class JobViewModel {
    
    typealias TitleCellViewData = (title: String, workTimeIndicator: WorkTimeIndicator)
    typealias DefaultCellViewData = (title: String, body: String)
    
    enum CellData {
        case title(TitleCellViewData)
        case `default`(DefaultCellViewData)
    }
    
    let cellData: [CellData]
    let howToApply: String
    
    init(job: Job) {
        cellData = job.cells
        howToApply = job.howToApply
    }
}

private extension Job {
    var cells: [JobViewModel.CellData] {
        var cells: [JobViewModel.CellData] = []
        
        cells.append(.title((title: title, workTimeIndicator: indicator)))
        cells.append(.default((title: "Salary", body: "$\(salaryRangeFrom) - $\(salaryRangeTo) \(salaryFrequency.formattedSalaryString)")))
        cells.append(.default((title: "Agency", body: agency)))
        cells.append(.default((title: "Division", body: divisionWorkUnit)))
        cells.append(.default((title: "Category", body: category)))
        
        if let requirements = minimumQualifications {
            cells.append(.default((title: "Requirements", body: requirements)))
        }
        
        if let residencyRequirement = residencyRequirement {
            cells.append(.default((title: "Residency Requirements", body: residencyRequirement)))
        }
        
        if preferredSkills != " " {
            cells.append(.default((title: "Preffered Skills", body: preferredSkills)))
        }
        
        cells.append(.default((title: "Description", body: description)))
        
        return cells
    }
}
