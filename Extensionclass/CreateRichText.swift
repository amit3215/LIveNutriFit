//
//  CreateRichText.swift
//  BCTConsulting
//
//  Created by Chetu-macmini-26 on 23/05/16.
//  Copyright © 2016 com.developer. All rights reserved.
//

import Foundation
extension UIViewController {
func convertText(inputText: String) -> NSAttributedString {
  
  var html = inputText
  
  // Replace newline character by HTML line break
  while let range = html.rangeOfString("\n") {
    html.replaceRange(range, with: "<br />")
  }
  
  // Embed in a <span> for font attributes:
  html = "<span style=\"font-family: Helvetica; font-size:11pt;\">" + html + "</span>"
  
  let data = html.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!
  
  var attributedstring = NSMutableAttributedString()
  
  do {
    attributedstring = try NSMutableAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute:NSUTF8StringEncoding], documentAttributes: nil)
    
    
  } catch let error as NSError {
    print(error.localizedDescription)
  }
    attributedstring.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSRange(location: 0,length:NSString(string: attributedstring.string).length ))
  
  return attributedstring
}
}