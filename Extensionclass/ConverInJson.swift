//
//  ConverInJson.swift
//  LIveNutriFit
//
//  Created by pragya on 22/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import Foundation
extension UIViewController {
func convertStringToDictionary(text: String) -> [String:AnyObject]? {
    if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
        do {
            return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
        } catch let error as NSError {
            print(error)
        }
    }
    return nil
}
}