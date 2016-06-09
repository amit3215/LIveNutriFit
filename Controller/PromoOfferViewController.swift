//
//  PromoOfferViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 05/06/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class PromoOfferViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
 @IBOutlet weak var tableView: UITableView!
    let cellIdentifier:String = "promoOffer"
    var offerList:[promoOffer] = [promoOffer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webServiceCallingTogetOfferData()
    
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
       
         self.addSlideMenuButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
     // MARK: - Tableview delegate method
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("header") as! offerHeaderTableViewCell
        switch (section) {
        case 0:
            headerCell.lblHeader.text = "Current Offers(Long Press To Copy Code)";
            headerCell.lblCount.text = "\(offerList.count)"
        default:
            print("no cell for this")
        }
        return headerCell
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offerList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! OfferTableViewCell
        let promoOffer = offerList[indexPath.row]
         cell.lblOfferCode.text = " \(promoOffer.PromoCode) "
        cell.lblDetailType.text = promoOffer.PromoName
        cell.lblPercentageDiscount.text = promoOffer.PromoDescription
        cell.lblExpDate.text = "Exp. \(promoOffer.ValidUpto)"
        cell.selectionStyle = .None
        cell.contentView.setNeedsLayout()
        cell.contentView.layoutIfNeeded()
        cell.updateBorder()
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
    }
    // MARK: - web Service method
    func webServiceCallingTogetOfferData(){
        dispatch_async(dispatch_get_main_queue(), {
            self.actionShowLoader()
            SwiftLoader.show("Loading...", animated: true)
        })
        var param = [String:AnyObject]()
        param[kJsonKey_PromoCode] = ""
        OfferDataWebServiceCalling(param, withUrlType: kPromoDiscount_GetList)
        
    }
    
   
    func OfferDataWebServiceCalling(param:[String:AnyObject], withUrlType Url:String) {
        ConnectionClass.patientLoginServiceImplementation(param, withUrlString: Url) { (data, error) -> Void in
            if error != nil{
                print(error?.description)
            }else{
                if data != nil{
                    do {
                        let result = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)as! NSDictionary
                        self.responceParsingforOfferData(result)
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
    func responceParsingforOfferData(result:NSDictionary)
    {
        if let dict = result["d"] as? String {
            let jsonData = convertStringToDictionary(dict)
            //  print(jsonData)
            if let requestStatus = jsonData!["Status"] as? [String:AnyObject] {
                if let status = requestStatus["Status"] as? Int{
                    if status == 1{
                        if let data = jsonData!["ResponseStatus"] as? NSArray{
                           offerList = ParserApi.parsingOfferArrayList(data)
                            dispatch_async(dispatch_get_main_queue(), {
                                self.tableView.delegate = self
                                self.tableView.dataSource = self
                              self.tableView.reloadData()
                             SwiftLoader.hide()
                            })
                        }
                      SwiftLoader.hide()
                   }
                }
            }
        }
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
