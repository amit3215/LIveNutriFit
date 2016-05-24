//
//  PersonalDetailViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 10/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class PersonalDetailViewController: UIViewController {
    enum TabIndex : Int {
        case personalTab = 0
        case lifeStyleTab = 1
        case medicalTab = 2
    }
    enum CurentControllerSubViewIndex : Int {
        case personal2 = 0
        case personal3 = 1
        case lifeStyle2 = 2
        case lifeStyle3 = 3
        case medical2 = 4
        case endOfProfile = 5
    }
    
    @IBOutlet weak var btnArrowToNext: UIButton!

    @IBOutlet weak var view_SegementBaseView: UIView!
    
    @IBOutlet weak var segemnet_PersonalDetail: UISegmentedControl!
    
    @IBOutlet weak var view_Pagging: UIView!
    
    var currentViewController: UIViewController?
    var subviewController:UIViewController?
    // personal
    lazy var personalTabVC: UIViewController? = {
    let personalTabVC = self.storyboard?.instantiateViewControllerWithIdentifier("personal")
        return personalTabVC
    }()
    // personal2
    lazy var personal2TabVC: UIViewController? = {
        let personal2TabVC = self.storyboard?.instantiateViewControllerWithIdentifier("personal2")
        return personal2TabVC
    }()
    // personal3
    lazy var personal3TabVC: UIViewController? = {
        let personal3TabVC = self.storyboard?.instantiateViewControllerWithIdentifier("personal3")
        return personal3TabVC
    }()
    // life style
    lazy var lifeStyleTabVC : UIViewController? = {
        let lifeStyleTabVC = self.storyboard?.instantiateViewControllerWithIdentifier("lifeStyle")
        return lifeStyleTabVC
    }()
    // life style2
    lazy var lifeStyle2TabVC : UIViewController? = {
        let lifeStyle2TabVC = self.storyboard?.instantiateViewControllerWithIdentifier("lifeStyle2")
        return lifeStyle2TabVC
    }()
    // life style3
    lazy var lifeStyle3TabVC : UIViewController? = {
        let lifeStyle3TabVC = self.storyboard?.instantiateViewControllerWithIdentifier("lifeStyle3")
        return lifeStyle3TabVC
    }()
    // medical
    lazy var medicalTabVC : UIViewController? = {
        let medicalTabVC = self.storyboard?.instantiateViewControllerWithIdentifier("medical")
        return medicalTabVC
    }()
    // medical2
    lazy var medical2TabVC : UIViewController? = {
        let medical2TabVC = self.storyboard?.instantiateViewControllerWithIdentifier("medical2")
        return medical2TabVC
    }()
   //MARK: lcontroller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(PersonalDetailViewController.methodToSkipTheMedicalDetails(_:)), name:"SkipPersonal" , object: nil)
        segemnet_PersonalDetail.tintColor = kColor_navigationBar
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.blackColor()]
        segemnet_PersonalDetail.setTitleTextAttributes(titleDict as [NSObject : AnyObject], forState: UIControlState.Normal)
        segemnet_PersonalDetail.selectedSegmentIndex = TabIndex.personalTab.rawValue
        displayCurrentTab(TabIndex.personalTab.rawValue)

    }
    override func viewWillAppear(animated: Bool) {
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barStyle = UIBarStyle.Default
        navigationBar?.barTintColor = kColor_navigationBar
        navigationBar?.tintColor = UIColor.whiteColor()
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segementValueChangeAction(sender: AnyObject) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(sender.selectedSegmentIndex)
        
    }
    
    // method to controll segemnent
    func displayCurrentTab(tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
            vc.view.frame = view_Pagging.bounds
            self.view_Pagging.addSubview(vc.view)
            self.currentViewController = vc
            self.subviewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.personalTab.rawValue :
            vc = personalTabVC
             segemnet_PersonalDetail.selectedSegmentIndex = 0
        case TabIndex.lifeStyleTab.rawValue :
            vc = lifeStyleTabVC
             segemnet_PersonalDetail.selectedSegmentIndex = 1
        case TabIndex.medicalTab.rawValue :
            vc = medicalTabVC
             segemnet_PersonalDetail.selectedSegmentIndex = 2
        default:
            return nil
        }
        return vc
    }
    // gesture recogniser
    
    @IBAction func leftSwipeGestureRecogniser(sender: AnyObject) {
        let index = segemnet_PersonalDetail.selectedSegmentIndex
        switch(index){
        case 1:
            self.currentViewController!.view.removeFromSuperview()
            self.currentViewController!.removeFromParentViewController()
            segemnet_PersonalDetail.selectedSegmentIndex = 0
            displayCurrentTab(0)
        case 2:
            self.currentViewController!.view.removeFromSuperview()
            self.currentViewController!.removeFromParentViewController()
            segemnet_PersonalDetail.selectedSegmentIndex = 1
            displayCurrentTab(1)
        default:
            print("nothing happen")
        }
        
        print("left gesture")
    }
    
    @IBAction func rightGestureRecognizer(sender: AnyObject) {
        let index = segemnet_PersonalDetail.selectedSegmentIndex
        switch(index){
        case 0:
            self.currentViewController!.view.removeFromSuperview()
            self.currentViewController!.removeFromParentViewController()
            segemnet_PersonalDetail.selectedSegmentIndex = 1
            displayCurrentTab(1)
        case 1:
            self.currentViewController!.view.removeFromSuperview()
            self.currentViewController!.removeFromParentViewController()
            segemnet_PersonalDetail.selectedSegmentIndex = 2
            displayCurrentTab(2)
        default:
            print("nothing happen")
        }
         print("right gesture")
    }
    
    @IBAction func arrowButtonTappedAction(sender: AnyObject) {
        if  currentViewController === personalTabVC{
            if subviewController === personalTabVC{
                if LiveNutriFitApi.sharedInstance.dateOfBirth != ""{
            self.currentViewController!.view.removeFromSuperview()
            self.currentViewController!.removeFromParentViewController()
                displayCurrentSubViewTab(0)
                }
            }else if subviewController === personal2TabVC{
                print(LiveNutriFitApi.sharedInstance.height)
                if LiveNutriFitApi.sharedInstance.currentWeight != 0 || LiveNutriFitApi.sharedInstance.targerWeight != 0 || LiveNutriFitApi.sharedInstance.height != 0 {
                self.currentViewController!.view.removeFromSuperview()
                self.currentViewController!.removeFromParentViewController()
                displayCurrentSubViewTab(1)
            }
            }else if subviewController === personal3TabVC{
                if LiveNutriFitApi.sharedInstance.noOFMonth != 0{
                self.currentViewController!.view.removeFromSuperview()
                self.currentViewController!.removeFromParentViewController()
                    //calling service for personal
                    
                displayCurrentTab(1) // display life style
                }
            }
        }else if currentViewController === lifeStyleTabVC{
            if subviewController === lifeStyleTabVC{
                self.currentViewController!.view.removeFromSuperview()
                self.currentViewController!.removeFromParentViewController()
                displayCurrentSubViewTab(2)
            }else if subviewController === lifeStyle2TabVC{
                self.currentViewController!.view.removeFromSuperview()
                self.currentViewController!.removeFromParentViewController()
                displayCurrentSubViewTab(3)
            }else if subviewController === lifeStyle3TabVC{
                self.currentViewController!.view.removeFromSuperview()
                self.currentViewController!.removeFromParentViewController()
                displayCurrentTab(2) // display life style
            }
        }else if currentViewController === medicalTabVC{
            if subviewController === medicalTabVC{
                self.currentViewController!.view.removeFromSuperview()
                self.currentViewController!.removeFromParentViewController()
                displayCurrentSubViewTab(4)
            } else if subviewController === medical2TabVC{
                self.currentViewController!.view.removeFromSuperview()
                self.currentViewController!.removeFromParentViewController()
               // displayCurrentSubViewTab(3)
                print("complete the flow")
                self.performSegueWithIdentifier(kSegue_AfterCreatingProfile, sender: self)
            }
        }
    }
    // method to controll personl segement pages
    func displayCurrentSubViewTab(personalSubViewIndex: Int){
        if let vc = viewControllerForSelectedSubviewIndex(personalSubViewIndex) {
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
            vc.view.frame = view_Pagging.bounds
            self.view_Pagging.addSubview(vc.view)
            self.subviewController = vc
        }
    }
    
    func viewControllerForSelectedSubviewIndex(index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case CurentControllerSubViewIndex.personal2.rawValue :
            vc = personal2TabVC
        case CurentControllerSubViewIndex.personal3.rawValue :
            vc = personal3TabVC
        case CurentControllerSubViewIndex.lifeStyle2.rawValue :
            vc = lifeStyle2TabVC
        case CurentControllerSubViewIndex.lifeStyle3.rawValue :
            vc = lifeStyle3TabVC
        case CurentControllerSubViewIndex.medical2.rawValue :
            vc = medical2TabVC
        default:
            return nil
        }
        return vc
    }
     func methodToSkipTheMedicalDetails(notification: NSNotification){
            NSNotificationCenter.defaultCenter().removeObserver(self)
         self.performSegueWithIdentifier(kSegue_AfterCreatingProfile, sender: self)
    }
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == kSegue_AfterCreatingProfile{
            let nextViewController  = segue.destinationViewController as! ThankYouViewController
            nextViewController.title = "title"
        }
    }

}
