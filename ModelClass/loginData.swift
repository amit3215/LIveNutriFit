//
//  loginObject.swift
//  LIveNutriFit
//
//  Created by pragya on 27/03/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import Foundation
import UIKit

@objc class LoginInfo : NSObject {
  private var profileImg: String!
    
   var patientId:NSNumber!
   var dieticianId:Int!
   var patientName:String!
    var emailId:String!
    var dob:String!
    var gender:String!
    var mobile:String!
    var address:String!
    var landmark:String!
    var countryId:Int!
    var stateId:Int!
    var city:String!
    var pincode:String!
    var targetWeight:Float!
    var targetWeightUnit:String!
    var targetTime:Float!
    var isActive:Bool!
    var createdOn: String!
    var leadConverted:Int!
    var referralCode:String!
    var password:String!
    var deviceId:String!
    var heightMeasureUnit:String!
    var weighttMeasureUnit:String!
    var weightLossJourney:String!
    var isVerified:Int!
    var isLifeStyleFilled:Int!
    var isMedicalHistoryFilled:Int!
    var packageId:Int!
    var totalPoint:Int!
    
    var profileImage: String!{
        get{
            if profileImg == nil{
                profileImg = ""
            }
            return profileImg
        }
        set(newValue){
            profileImg =  "url\(newValue)"
        }
        
    }
    override init(){
    }
    
}