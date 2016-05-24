//
//  StringToFloat.swift
//  LIveNutriFit
//
//  Created by pragya on 22/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import Foundation
import UIKit
extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}