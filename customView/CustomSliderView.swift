//
//  CustomSliderView.swift
//  LIveNutriFit
//
//  Created by pragya on 30/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class CustomSliderView: UISlider {

  var markColor:UIColor!
  var markWidth:CGFloat!
  var selectedBarColor:UIColor!
  var unselectedBarColor:UIColor!
  var handlerImage:UIImage!
  var markPositions:NSArray = []
  var handlerColor:UIColor!
  
  override init(frame: CGRect) {
     super.init(frame: frame)
      self.markColor = UIColor.redColor()
      self.markWidth = 1.0;
      self.selectedBarColor = UIColor.yellowColor()
      self.unselectedBarColor = UIColor.blueColor()
   //  return self
  
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.markColor = UIColor.redColor()
    self.markWidth = 1.0;
    self.selectedBarColor = UIColor.yellowColor()
    self.unselectedBarColor = UIColor.blueColor()
    //  fatalError("init(coder:) has not been implemented")
    // return self
  }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
       */
  override func drawRect(rect: CGRect) {
    super.drawRect(rect)
    // We create an innerRect in which we paint the lines
    let innerRect:CGRect =  CGRectInset(rect, 1.0, 10.0)
    UIGraphicsBeginImageContextWithOptions(innerRect.size, false, 0)
    let context:CGContextRef = UIGraphicsGetCurrentContext()!
    // Selected side
    CGContextSetLineCap(context, CGLineCap.Round)
    CGContextSetLineWidth(context, 12.0)
    CGContextMoveToPoint(context, 6, CGRectGetHeight(innerRect)/2)
    CGContextAddLineToPoint(context, innerRect.size.width - 10, CGRectGetHeight(innerRect)/2)
    CGContextSetStrokeColorWithColor(context, selectedBarColor.CGColor)
    CGContextStrokePath(context)
    let selectedSide:UIImage = UIGraphicsGetImageFromCurrentImageContext().resizableImageWithCapInsets(UIEdgeInsetsZero)
  
    // Unselected side
    CGContextSetLineCap(context, CGLineCap.Round)
    CGContextSetLineWidth(context, 12.0)
    CGContextMoveToPoint(context, 6, CGRectGetHeight(innerRect)/2)
    CGContextAddLineToPoint(context, innerRect.size.width - 10, CGRectGetHeight(innerRect)/2)
    CGContextSetStrokeColorWithColor(context, unselectedBarColor.CGColor)
    CGContextStrokePath(context);
    let unselectedSide:UIImage = UIGraphicsGetImageFromCurrentImageContext().resizableImageWithCapInsets(UIEdgeInsetsZero)
    // Set trips on selected side
    selectedSide.drawAtPoint(CGPointMake(0, 0))
      for (var i = 0;i < markPositions.count ;i += 1){
      CGContextSetLineWidth(context, self.markWidth)
      let position:Float = Float(self.markPositions[i] as! NSNumber) * Float(innerRect.size.width) / 100.0
      CGContextMoveToPoint(context, CGFloat(position), CGRectGetHeight(innerRect)/2 - 5)
      CGContextAddLineToPoint(context,  CGFloat(position), CGRectGetHeight(innerRect)/2 + 5)
      CGContextSetStrokeColorWithColor(context, self.markColor.CGColor)
      CGContextStrokePath(context)
    }
    let selectedStripSide:UIImage = UIGraphicsGetImageFromCurrentImageContext().resizableImageWithCapInsets(UIEdgeInsetsZero)
    // Set trips on unselected side

    unselectedSide.drawAtPoint(CGPointMake(0,0))
    for (var i = 0; i < self.markPositions.count; i += 1) {
      CGContextSetLineWidth(context, self.markWidth);
      let position:Float = Float(self.markPositions[i] as! NSNumber) * Float(innerRect.size.width) / 100.0
      CGContextMoveToPoint(context, CGFloat(position), CGRectGetHeight(innerRect)/2 - 5);
      CGContextAddLineToPoint(context,  CGFloat(position), CGRectGetHeight(innerRect)/2 + 5);
      CGContextSetStrokeColorWithColor(context, self.markColor.CGColor)
      CGContextStrokePath(context);
      }
    let unselectedStripSide:UIImage = UIGraphicsGetImageFromCurrentImageContext().resizableImageWithCapInsets(UIEdgeInsetsZero)
     UIGraphicsEndImageContext()
    self.setMaximumTrackImage(unselectedStripSide, forState: UIControlState.Normal)
      self.setMinimumTrackImage(selectedStripSide, forState: UIControlState.Normal)
    if self.handlerImage != nil{
      self.setThumbImage(self.handlerImage, forState: UIControlState.Normal)
    }else if self.handlerColor != nil{
      let image:UIImage = UIImage()
      self.setThumbImage(nil, forState: UIControlState.Normal)
      self.thumbTintColor = self.handlerColor
    }
  }
}
