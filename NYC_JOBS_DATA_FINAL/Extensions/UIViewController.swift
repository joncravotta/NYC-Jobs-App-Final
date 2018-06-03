//
//  UIViewController.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 5/28/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setUpDefaultNavgationStyle() {
        //navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
    }
}
