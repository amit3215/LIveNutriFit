//
//  CoachDetailsViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 30/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class CoachDetailsViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var selectButton: UIButton!
   
    //
      var currentPage:CGFloat!
    @IBOutlet weak var pageController: UIPageControl!
    var parseData:[CoachDetail]!
    var pageViews: [UIView] = []
    var pageContentOffSet :CGFloat!
    //
    var xPosition:CGFloat = 0
    var scrollViewContentSize:CGFloat=0;
    
//    lazy var coachDetail: UIViewController? = {
//        let coachDetail = self.storyboard?.instantiateViewControllerWithIdentifier(kStoryboardIdentifier)
//        return coachDetail
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
      //  self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 2, self.scrollView.frame.height)
        let subviewViewWidth:CGFloat = self.scrollView.frame.width
        let subviewViewHeight:CGFloat = self.scrollView.frame.height - 80
        dispatch_async(dispatch_get_main_queue(),{
            
    for (index,object) in self.parseData.enumerate(){
    let coachViewController = self.storyboard?.instantiateViewControllerWithIdentifier(kStoryboardIdentifier) as! CoachModelViewViewController
           let coatchDetail:UIView = coachViewController.view
            coachViewController.viewDidLoad(object)
            if index == 0{
              //  self.ViewCoachView.subviews
                let view1:UIView = UIView(frame: CGRectMake(0, 0, subviewViewWidth - 50, subviewViewHeight))
                view1.addSubview(coatchDetail)
                self.scrollView.addSubview(view1)
            }else{
                let view2:UIView = UIView(frame: CGRectMake(subviewViewWidth * CGFloat(index), 0, subviewViewWidth - 50, subviewViewHeight))
               // view2.backgroundColor = UIColor.blueColor()
                view2.addSubview(coatchDetail)
                self.scrollView.addSubview(view2)
            }
        }
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * CGFloat(self.parseData.count) , self.scrollView.frame.height-80)
        self.scrollView.delegate = self
     //   self.pageController.currentPage = 0
        })
        
    }
    func loadTheContentOnScrollView(){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        currentPage = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
      //  self.pageController.currentPage = Int(currentPage);
        // Change the text accordingly
//        if Int(currentPage) == 0{
//          
//        }else if Int(currentPage) == 1{
//            
//        }else if Int(currentPage) == 2{
//           
//        }else{
//        UIView.animateWithDuration(1.0, animations: { () -> Void in
      //  self.startButton.alpha = 1.0
//            })
      //  }
    }

    @IBAction func selectButtonTapped(sender: AnyObject) {
      
    print("Selected coach index is \(currentPage) ")
        
        
    }
    
    
}

