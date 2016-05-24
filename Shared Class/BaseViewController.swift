//
//  BaseViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit

 @objc class BaseViewController: UIViewController, SlideMenuDelegate {
     var menuViewController: UIViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func slideMenuItemSelectedAtIndex(index: Int) {
        let topViewController : UIViewController = self.navigationController!.topViewController!
        print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
        case 0:
            print("Home\n", terminator: "")
            break
        case 1:
            print("Play\n", terminator: "")
            break
        case 2:
            let storyboard = UIStoryboard(name: "MainPayU", bundle: nil)
            let mainViewController = storyboard.instantiateViewControllerWithIdentifier("PayU") as! ViewController
            let nav:UINavigationController = UINavigationController(rootViewController:mainViewController)
            appDelegate.window?.rootViewController = nav
        
        default:
            print("default\n", terminator: "")
        }
    }

    func addSlideMenuButton(){
        let btnShowMenu = UIButton(type: UIButtonType.System)
        btnShowMenu.setImage(UIImage(named: "ic_menu_black"), forState: UIControlState.Normal)
        btnShowMenu.tintColor = UIColor.grayColor()
        btnShowMenu.frame = CGRectMake(0, 0, 25, 25)
        btnShowMenu.addTarget(self, action:#selector(BaseViewController.onSlideMenuButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem;
    }
    
    func onSlideMenuButtonPressed(sender : UIButton){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as! MenuViewController
        menuViewController.delegate = self
        self.menuViewController = UINavigationController(rootViewController: menuViewController)
        let menuView :UIView = self.menuViewController.view
        
        menuView.tag = 5001
        let window = UIApplication.sharedApplication().keyWindow
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromLeft
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        menuView.layer.addAnimation(transition, forKey: nil)
        window?.addSubview(menuView)
        }
}