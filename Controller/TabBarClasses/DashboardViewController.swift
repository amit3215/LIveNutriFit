//
//  DashboardViewController.swift
//  LIveNutriFit
//
//  Created by Sameera Sadaqat on 23/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var loginInfo:LoginInfo = LiveNutriFitApi.sharedInstance.loginData
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
         webServiceCallingToGetDashBordData()

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
    //MARK: table view delegate method
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cellIdentifier = kCell_DashBoardBMI
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! BMIStatusTableViewCell
            cell.lblStepText.text = "2000 Steps | Target 7000"
            cell.selectionStyle = .None
            return cell
        case 1:
            let cellIdentifier = kCell_DashBoardPower7
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! DashBoardPower7TableViewCell
            cell.lblNoOfSleep.text = "0/1"
            cell.lblNoOfWater.text = "1/7"
            cell.lblNoOfProten.text = "1/2"
            cell.lblNoOfVegges.text = "1/3"
            cell.lblNoOfFruits.text = "1/2"
            cell.lblNoOfNuts.text = "1/1"
            cell.lblNoOfExcercise.text = "1/1"
            cell.selectionStyle = .None
            return cell
        case 2:
            let cellIdentifier = kCellCoachHeader
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CoachTableViewCell
            cell.selectionStyle = .None
            cell.CellTitleLable.text = dashBoard[indexPath.row]
            return cell
        case 3,4,5,6,7:
            let cellIdentifier = kCellCoachSlider
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CoachSliderTableViewCell
            cell.selectionStyle = .None
            cell.lblCellHeader.text = dashBoard[indexPath.row]
            switch indexPath.row {
            case 3:
            cell.lblCellContent.text = String( loginInfo.targetWeight)
                
            default:
                 cell.lblCellContent.text = String(loginInfo.targetWeight)
            }
            cell.slider.value = 80
             return cell
        case 8:
            let cellIdentifier = kCellweightLossJourny
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! WeightLossHeaderTableViewCell
            cell.selectionStyle = .None
            cell.cellHeaderWithData.text = dashBoard[indexPath.row]
            return cell
        case 9,10,11,13:
            let cellIdentifier = kCellWeightLossDetails
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! WeightLossTableViewCell
            cell.selectionStyle = .None
            cell.cellHeader.text = dashBoard[indexPath.row]
            return cell
        case 12:
            let cellIdentifier = kCellWeightLossDetailsExt
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! WeightLossExtraLblTableViewCell
            cell.selectionStyle = .None
            cell.cellHeader.text = dashBoard[indexPath.row]
            cell.cellDetailContent.text = "Cardic/metabolic risk"
            return cell
            
        default:
            return UITableViewCell()

        }
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
           return 450
        case 1,3,4,5,6,7,8,14:
            return 70
            
        default:
            return 50
        }
    }
    // MARK: - web service calling
    func webServiceCallingToGetDashBordData(){
        dispatch_async(dispatch_get_main_queue(), {
            self.actionShowLoader()
            SwiftLoader.show("Loading...", animated: true)
        })
        var param = [String:AnyObject]()
        param[kJsonKey_PatientId] = LiveNutriFitApi.sharedInstance.loginData.patientId
        
        GetDashBoardDataWebServiceCalling(param, withjson: kPatient_GetDashboardDetails)
        
    }
    func GetDashBoardDataWebServiceCalling(param:[String:AnyObject], withjson type:String) {
        ConnectionClass.patientLoginServiceImplementation(param, withUrlString: type) { (data, error) -> Void in
            if error != nil{
                print(error?.description)
            }else{
                if data != nil{
                    do {
                        let result = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)as! NSDictionary
                        self.responceParsingforDashBoard(result)
                    } catch {
                        print("Error -> \(error)")
                    }
                }else{
                    // network not connected
                    
                }
            }
        }
        
    }
    // responce parser for update alarm data
    func responceParsingforDashBoard(result:NSDictionary)
    {
        if let dict = result["d"] as? String {
            let jsonData = convertStringToDictionary(dict)
            //  print(jsonData)
            if let requestStatus = jsonData!["Status"] as? [String:AnyObject] {
                if let status = requestStatus["Status"] as? Int{
                    if status == 1{
                        let powerOfSevenContent = jsonData!["PowerOfServenPointList"] as! [NSDictionary]
                        print(powerOfSevenContent)
//                        let data = ParserApi.parsingPowerOfSevenData(powerOfSevenContent)
//                         print(data)
                        //   LiveNutriFitApi.sharedInstance.power7Content = data
                        SwiftLoader.hide()
                        
                    }
                }
            }
        }
    }
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
