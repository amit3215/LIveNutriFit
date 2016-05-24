//
//  demo.swift
//  demo
//
//  Created by pragya on 17/05/16.
//  Copyright © 2016 pragya. All rights reserved.
//

import Foundation

@objc class MyClass: NSObject {
    var property:String = ""
    func method() {
        print(self.property)
    }
}