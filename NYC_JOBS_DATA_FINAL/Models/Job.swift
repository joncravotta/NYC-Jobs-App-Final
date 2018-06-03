//
//  Job.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 5/28/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation

enum WorkTimeIndicator {
    case fullTime
    case partTime
}

struct Job: Codable {
    
    let id: String
    let agency: String
    let title: String
    let divisionWorkUnit: String
    let category: String
    let description: String
    let minimumQualifications: String?
    let preferredSkills: String
    let residencyRequirement: String?
    let workTimeIndicator: String
    let workLocation: String
    let salaryFrequency: String
    let salaryRangeFrom: String
    let salaryRangeTo: String
    let additionalInfo: String
    let howToApply: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "job_id"
        case agency
        case title = "business_title"
        case divisionWorkUnit = "division_work_unit"
        case category = "job_category"
        case description = "job_description"
        case minimumQualifications = "minimum_qual_requirements"
        case preferredSkills = "preferred_skills"
        case residencyRequirement = "residency_requirement"
        case workTimeIndicator = "full_time_part_time_indicator"
        case workLocation = "work_location"
        case salaryFrequency = "salary_frequency"
        case salaryRangeFrom = "salary_range_from"
        case salaryRangeTo = "salary_range_to"
        case additionalInfo = "additional_information"
        case howToApply = "to_apply"
    }
}

extension Job {
    var indicator: WorkTimeIndicator {
        switch workTimeIndicator {
        case "F": return .fullTime
        case "P": return .partTime
        default: return .fullTime
        }
    }
}
