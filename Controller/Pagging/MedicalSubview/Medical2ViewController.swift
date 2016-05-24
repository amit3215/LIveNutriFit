//
//  Medical2ViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 21/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
import AVFoundation

class Medical2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,DocumentSelection,removePopup,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
     var arrayOfArray:[[String:[String]]] = [[String:[String]]]()
    var popViewController: UIViewController!
     var subView:UIView!
    // camera access variable
    let captureSession = AVCaptureSession()
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
    imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // content creater
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kMedical2Array.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cellIdentifier = kCellIdentifer_EightButton
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! EightbuttonTableViewCell
                cell.lblCellHeader.text = kMedical2Array[indexPath.row]
                cell.btn1.setTitle(kMedicalSubArray[0], forState: UIControlState.Normal)
                cell.btn2.setTitle(kMedicalSubArray[1], forState: UIControlState.Normal)
                cell.btn3.setTitle(kMedicalSubArray[2], forState: UIControlState.Normal)
                cell.btn4.setTitle(kMedicalSubArray[3], forState: UIControlState.Normal)
                cell.btn5.setTitle(kMedicalSubArray[4], forState: UIControlState.Normal)
                cell.btn6.setTitle(kMedicalSubArray[5], forState: UIControlState.Normal)
                cell.btn7.setTitle(kMedicalSubArray[6], forState: UIControlState.Normal)
                cell.btn8.setTitle(kMedicalSubArray[6], forState: UIControlState.Normal)
            cell.selectionStyle = .None
            return cell

        case 1:
            let cellIdentifier = kCellIdentifer_headerWithSwitch
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! medicalWithSawitchTableViewCell
                cell.lblCellHeader.text =  kMedical2Array[indexPath.row]
               cell.selectionStyle = .None
            return cell
        case 2:
            let cellIdentifier = kCellIdentifer_headerWithButton
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! DocumentTableViewCell
            cell.lblCellHeader.text =  kMedical2Array[indexPath.row]
            cell.delegate = self
            cell.selectionStyle = .None
            return cell
        default:
            print("default")
            return UITableViewCell()
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 120
        default:
            return 50
        }
    }
    // delegate method
    func documentSelectionButtonTapped(){
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("documentSelection") as!
        DocumentSelectionPopUpViewController
         viewController.delegate = self
         self.popViewController = UINavigationController(rootViewController: viewController)
      //  self.popViewController.
        subView = self.popViewController.view
         subView.tag = 5000
        self.view.addSubview(subView)
        
    }
    func RemoveSubViewfromSuperview(){
        subView.removeFromSuperview()
    }
    func cameraButtonTapped(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            self .presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    func galleryButtonTapped(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            LiveNutriFitApi.sharedInstance.ImageDocument = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
         RemoveSubViewfromSuperview()
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
         RemoveSubViewfromSuperview()
    }

}
