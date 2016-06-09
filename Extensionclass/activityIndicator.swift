//
//  activityIndicator.swift
//  BCTConsulting
//
//  Created by Chetu-macmini-26 on 17/05/16.
//  Copyright © 2016 com.developer. All rights reserved.
//

import Foundation
extension UIViewController{
  func actionShowLoader() {
    var config : SwiftLoader.Config = SwiftLoader.Config()
    config.size = 150
    config.backgroundColor = UIColor.whiteColor()
    config.spinnerColor = kColor_navigationBar
    config.titleTextColor = kColor_navigationBar
    config.spinnerLineWidth = 3.0
    config.foregroundColor = UIColor.blackColor()
    config.foregroundAlpha = 0.5
    
    
    SwiftLoader.setConfig(config)
    SwiftLoader.show(true)
    
//    delay(seconds: 1.0) { () -> () in
//      SwiftLoader.show("Loading...", animated: true)
//    }
//    delay(seconds: 4.0) { () -> () in
//      SwiftLoader.hide()
//    }
    
  }
  func delay(seconds seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
      completion()
    }
  }

}