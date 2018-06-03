//
//  UIColor.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 5/29/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public static var customBlue: UIColor { return UIColor.color(withRed: 72,  green: 66,  blue: 244) }
    public static var customPink: UIColor { return UIColor.color(withRed: 244,  green: 66,  blue: 136) }
    
    fileprivate static func color(withRed red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat = 1) -> UIColor {
        return UIColor(red:red/255.0, green:green/255.0, blue: blue/255.0, alpha:alpha)
    }
}
