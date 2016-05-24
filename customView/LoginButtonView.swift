//
//  LoginButtonView.swift
//  LIveNutriFit
//
//  Created by Chetu-macmini-26 on 13/02/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

@IBDesignable class LoginButtonView: UIView {
  var view:UIView!
  var nibName: String = "LoginButtonView"
  @IBOutlet weak var upperLabel: UILabel!
  @IBOutlet weak var lowerLabel: UILabel!
  
  
  @IBInspectable var buttonUpperLabel: String? {
    get {
      return upperLabel.text
    }
    set(title) {
      upperLabel.text = title
    }
  }

  @IBInspectable var buttonLowerLabel: String? {
    get {
      return lowerLabel.text
    }
    set(title) {
      lowerLabel.text = title
    }
  }

  
  override init(frame: CGRect) {
    // properties
    super.init(frame: frame)
    
    // Set anything that uses the view or visible bounds
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    // properties
    super.init(coder: aDecoder)
    
    // Setup
    setup()
  }
  func setup() {
    view = loadViewFromNib()
    view.frame = bounds
    view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
    addSubview(view)
  }
  
  func loadViewFromNib() -> UIView {
    let bundle = NSBundle(forClass: self.dynamicType)
    let nib = UINib(nibName: nibName, bundle: bundle)
    let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
    
    return view
  }
}
// comented code
//  @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
//    didSet {
//      layer.borderColor = borderColor.CGColor
//    }
//  }
//
//  @IBInspectable var borderWidth: CGFloat = 0 {
//    didSet {
//      layer.borderWidth = borderWidth
//    }
//  }
//
//  @IBInspectable var cornerRadius: CGFloat = 0 {
//    didSet {
//      layer.cornerRadius = cornerRadius
//    }
//  }
//  override func awakeFromNib() {
//    super.awakeFromNib()
//  }