//
//  PowerOf7ViewController.swift
//  LIveNutriFit
//
//  Created by Sameera Sadaqat on 23/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class PowerOf7ViewController: BaseViewController{
    var btnSender: UIButton? = UIButton()
    var currentViewController: UIViewController?
    var subviewController:UIViewController?
    @IBOutlet weak var viewPowerPagging: UIView!
    
    enum TabIndex : Int {
        case Power7SleepVC = 0
        case Power7WaterVC = 1
        case Power7ProtienVC = 2
        case Power7VeggisVC = 3
        case Power7FruitsVC = 4
        case Power7NutsVC = 5
        case Power7ExerciseVC = 6
    }
    // 2 nd tab button
    @IBOutlet weak var power7Sleep: UIButton!
    @IBOutlet weak var power7Water: UIButton!
    @IBOutlet weak var power7Nuts: UIButton!
    @IBOutlet weak var power7Exercise: UIButton!
    @IBOutlet weak var power7Fruits: UIButton!
    @IBOutlet weak var power7Veggis: UIButton!
    @IBOutlet weak var power7Protien: UIButton!
    //Power7Sleep
    lazy var Power7SleepVC: UIViewController? = {
        let Power7SleepVC = self.storyboard?.instantiateViewControllerWithIdentifier("Power7Sleep")
        return Power7SleepVC
    }()
     // Power7Water
    lazy var Power7WaterVC: UIViewController? = {
        let Power7WaterVC = self.storyboard?.instantiateViewControllerWithIdentifier("Power7Water")
        return Power7WaterVC
    }()
    //Power7Nuts
    lazy var Power7NutsVC: UIViewController? = {
        let Power7NutsVC = self.storyboard?.instantiateViewControllerWithIdentifier("Power7Nuts")
        return Power7NutsVC
    }()
    //Power7Exercise
    lazy var Power7ExerciseVC : UIViewController? = {
        let Power7ExerciseVC = self.storyboard?.instantiateViewControllerWithIdentifier("Power7Exercise")
        return Power7ExerciseVC
    }()
   //Power7Fruits
    lazy var Power7FruitsVC : UIViewController? = {
        let Power7FruitsVC = self.storyboard?.instantiateViewControllerWithIdentifier("Power7Fruits")
        return Power7FruitsVC
    }()
    //Power7Veggis
    lazy var Power7VeggisVC : UIViewController? = {
        let Power7VeggisVC = self.storyboard?.instantiateViewControllerWithIdentifier("Power7Veggis")
        return Power7VeggisVC
    }()
   //Power7Protien
    lazy var Power7ProtienVC : UIViewController? = {
        let Power7ProtienVC = self.storyboard?.instantiateViewControllerWithIdentifier("Power7Protien")
        return Power7ProtienVC
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        btnSender!.tag = 10
        displayCurrentTab(TabIndex.Power7SleepVC.rawValue)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barStyle = UIBarStyle.Default
        navigationBar?.barTintColor = kColor_navigationBar
        navigationBar?.tintColor = UIColor.whiteColor()
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
         self.addSlideMenuButton()
    }
    
    @IBAction func onClickSleep(sender: AnyObject) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(0)
    }
    @IBAction func onClickWater(sender: AnyObject) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(1)
    }
    @IBAction func onClickProtien(sender: AnyObject) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(6)
        }
    @IBAction func onClickVeggies(sender: AnyObject) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(5)
        }
    @IBAction func onClickFruits(sender: AnyObject) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(4)
        }
    @IBAction func onClickNuts(sender: AnyObject) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(2)
    }
    @IBAction func onClickExercise(sender: AnyObject) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(3)
    }
    
    
    // method to controll segemnent
    func displayCurrentTab(tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
            vc.view.frame = viewPowerPagging.bounds
            self.viewPowerPagging.addSubview(vc.view)
            self.currentViewController = vc
            self.subviewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.Power7SleepVC.rawValue :
            vc = Power7SleepVC
            power7Sleep.highlighted = true
            power7Water.highlighted = false
            power7Nuts.highlighted = false
            power7Exercise.highlighted = false
            power7Fruits.highlighted = false
            power7Veggis.highlighted = false
            power7Protien.highlighted = false
        case TabIndex.Power7WaterVC.rawValue :
              vc = Power7WaterVC
             power7Water.highlighted = true
             power7Sleep.highlighted = false
             power7Nuts.highlighted = false
            power7Exercise.highlighted = false
            power7Fruits.highlighted = false
            power7Veggis.highlighted = false
             power7Protien.highlighted = false
        case TabIndex.Power7NutsVC.rawValue :
            vc = Power7NutsVC
            power7Nuts.highlighted = true
             power7Sleep.highlighted = false
             power7Water.highlighted = false
            power7Exercise.highlighted = false
            power7Fruits.highlighted = false
            power7Veggis.highlighted = false
             power7Protien.highlighted = false
        case TabIndex.Power7ExerciseVC.rawValue :
            vc = Power7ExerciseVC
            power7Exercise.highlighted = true
             power7Sleep.highlighted = false
             power7Water.highlighted = false
             power7Nuts.highlighted = false
            power7Fruits.highlighted = false
            power7Veggis.highlighted = false
             power7Protien.highlighted = false
        case TabIndex.Power7FruitsVC.rawValue :
            vc = Power7FruitsVC
            power7Fruits.highlighted = true
             power7Sleep.highlighted = false
             power7Water.highlighted = false
             power7Nuts.highlighted = false
            power7Exercise.highlighted = false
            power7Veggis.highlighted = false
             power7Protien.highlighted = false
        case TabIndex.Power7VeggisVC.rawValue :
            vc = Power7VeggisVC
            power7Veggis.highlighted = true
             power7Sleep.highlighted = false
             power7Water.highlighted = false
             power7Nuts.highlighted = false
            power7Exercise.highlighted = false
            power7Fruits.highlighted = false
            power7Protien.highlighted = false
        case TabIndex.Power7ProtienVC.rawValue :
            vc = Power7ProtienVC
             power7Protien.highlighted = true
             power7Sleep.highlighted = false
             power7Water.highlighted = false
             power7Nuts.highlighted = false
             power7Exercise.highlighted = false
             power7Fruits.highlighted = false
             power7Veggis.highlighted = false
        default:
            return nil
        }
        return vc
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
