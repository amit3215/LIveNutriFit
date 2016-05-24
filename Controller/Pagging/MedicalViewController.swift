//
//  MedicalViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 10/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class MedicalViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,medicalBaseDelegate,medicalHeaderDelegate {
    
    @IBOutlet weak var tblView_MedicalDetails: UITableView!
    
    @IBOutlet weak var viewPopPup: UIView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    
// controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if (LiveNutriFitApi.sharedInstance.diseaseArray == nil){
        createAnModelObjectArray()
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        viewPopPup.hidden = false
        lblDescription.text =  kMedicalDetailsText
        btnSkip.setTitle("SKIP", forState: UIControlState.Normal)
        btnContinue.setTitle("CONTINUE", forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createAnModelObjectArray(){
       var detailList:[mediacalDetails] = [mediacalDetails]()
       for (index,value) in karrayDisease.enumerate(){
        let info = mediacalDetails()
        info.diseaseName = value
        info.selfStatus = false
        info.familyStatus = false
        info.index = index
        detailList.append(info)
        }
        LiveNutriFitApi.sharedInstance.diseaseArray = detailList
    }
    // tableview delegate method
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LiveNutriFitApi.sharedInstance.diseaseArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let object = LiveNutriFitApi.sharedInstance.diseaseArray[indexPath.row]
        if indexPath.row == 0{
            let cellIdentifier = "medicalTopCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MedicalCellTableViewCell
             cell.lbl_DiseasesTitle.text  = object.diseaseName
            if  object.selfStatus == true {
                cell.switch_self.setOn(true, animated: false)
            }else{
                 cell.switch_self.setOn(false, animated: false)
            }
            if  object.familyStatus == true {
                cell.switch_Family.setOn(true, animated: false)
            }else{
                cell.switch_Family.setOn(false, animated: false)
            }
            cell.switch_self.tag = indexPath.row
            cell.switch_Family.tag = indexPath.row
            cell.delegate = self
            cell.selected = false
            return cell
    }else{
            let cellIdentifier = "medicalBaseCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MedicalBaseTableViewCell
            cell.lbl_DiseasesTitle.text  = object.diseaseName
            if  object.selfStatus == true {
                cell.switch_self.setOn(true, animated: false)
            }else{
                cell.switch_self.setOn(false, animated: false)
            }
            if  object.familyStatus == true {
                cell.switch_Family.setOn(true, animated: false)
            }else{
                cell.switch_Family.setOn(false, animated: false)
            }
            cell.switch_self.tag = indexPath.row
            cell.switch_Family.tag = indexPath.row
            cell.delegate = self
            cell.selected = false


            return cell
            
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 85
        }else{
            return 60
        }
    }
    // delegate methods
    func selfSwitchValueChanged(Index: Int,typeOfSender switchValue:Bool){
        let object = LiveNutriFitApi.sharedInstance.diseaseArray[Index] as mediacalDetails
        if switchValue{
         object.selfStatus = true
        }else{
          object.selfStatus = false
        }
        LiveNutriFitApi.sharedInstance.diseaseArray.removeAtIndex(Index)
        LiveNutriFitApi.sharedInstance.diseaseArray.insert(object, atIndex: Index)
        
    }
    func familySwitchValueChanged(Index: Int,typeOfSender switchValue:Bool){
        let object = LiveNutriFitApi.sharedInstance.diseaseArray[Index] as mediacalDetails
        if switchValue{
            object.familyStatus = true
        }else{
            object.familyStatus = false
        }
        LiveNutriFitApi.sharedInstance.diseaseArray.removeAtIndex(Index)
        LiveNutriFitApi.sharedInstance.diseaseArray.insert(object, atIndex: Index)
        
        
    }
    
    
    @IBAction func skipButtonTappedAction(sender: AnyObject) {
        viewPopPup.hidden = true
        NSNotificationCenter.defaultCenter().postNotificationName("SkipPersonal", object: nil)
        
    }
    
   
    @IBAction func continueButtonTappedAction(sender: AnyObject) {
        
        
         viewPopPup.hidden = true
    }
    
}
