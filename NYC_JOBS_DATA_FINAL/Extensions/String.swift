//
//  String.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 6/3/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation

extension String {
    var formattedSalaryString: String {
        guard self == "Annual" else { return self }
        return "Annually"
    }
}
