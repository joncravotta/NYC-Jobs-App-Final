//
//  State.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 5/28/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation

enum State<T> {
    case initial
    case updating
    case didUpdate(T)
    case didFailToUpdate
}
