//
//  MenuViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 08/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//
@objc protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(index: Int)
}
import UIKit

class MenuViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var btnMenu : UIButton!
    var delegate : SlideMenuDelegate?
    // cancel button in popover menu
    @IBOutlet weak var btn_Cancel: UIButton!
   // collection view controller
    @IBOutlet weak var collectionView_Menu: UICollectionView!
    private let reuseIdentifier = "collectionViewCell"
    var imageArray:[String] = ["Image-1","Image-2","Image-3","Image-4","Image-5","Image-6","Image-7","Image-8","Image-9","Image-10","Image-11","Image-12","Image-13","Image-14","Image-15"]
    var iconName:[String] = ["DashBoard","My Coach","Power of 7","Offer & Promotions","Quit","D Stress","Meds & Supplements","Nutrifit Plan","Free Foods","My Grocery List","my Gratitude","My Profile","Leader Board","How it Works","Settings"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationController?.navigationBar.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButtonTappedAction(sender: AnyObject) {
        let window = UIApplication.sharedApplication().keyWindow
        if let selectedView = window?.viewWithTag(5001){
            let view: UIView = selectedView as UIView
            UIView.animateWithDuration(1, delay: 0.3, options: UIViewAnimationOptions.CurveEaseOut,animations: {view.frame = CGRectMake(0, 0, -view.frame.width ,view.frame.height)},
            completion: {(value: Bool) in
            view.removeFromSuperview()
            })
        }
    }
   // collection view delegate method
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return  15
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MenuCollectionViewCell
//        cell.btnIconImage.setBackgroundImage(UIImage(named: imageArray[indexPath.row]), forState: UIControlState.Normal)
        cell.lblCellHeader.text = iconName[indexPath.row]
        cell.cellImgView.image = UIImage(named: imageArray[indexPath.row])
        cell.cellImgView.layer.borderColor = UIColor.whiteColor().CGColor
        cell.cellImgView.layer.cornerRadius = cell.cellImgView.frame.size.width/7.5
        cell.cellImgView.layer.borderWidth = 2
       // cell.backgroundColor = UIColor.redColor()
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemSizeWidth = collectionView.frame.size.width - 20
        let itemSizeheight = collectionView.frame.size.height - 5
        return CGSizeMake(itemSizeWidth/3, itemSizeheight/5)
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
       delegate?.slideMenuItemSelectedAtIndex(indexPath.row as Int)
    }

// method to create a menu view
    func methodToCreateAMenulistSlider() {
    //    var contentArray:[sliderArray] = [sliderArray]()

        
        
    }
}
class sliderArray {
    var image:UIImage!
    var iconName:String!
    init(){
    }
}
