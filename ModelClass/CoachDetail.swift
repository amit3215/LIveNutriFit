//
//  CoachDetail.swift
//  LIveNutriFit
//
//  Created by pragya on 01/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class CoachDetail {
    private var dieticianImage:String!
    var dieticianId:Int!
    var dieticianName:String!
    var emailId:String!
    var address:String!
    var endDate:String!
    var flagOnLeave:Int!
    var hobbies:String!
    var isActive:Bool!
    var isInHouseCoach:Int!
    var isMaped:Int!
    var isMentor:String!
    var isPremium:Int!
    var mapedPatientId:Int!
    var mobile:String!
    var packageAmount:Int!
    var password:String!
    var profileSummary:String!
    var qualification:String!
    var refStateId:Int!
    var referralCode:String!
    var slotShift:String!
    var startDate:String!
    var totalMemberCanAssign:Int!
    
    var dieticianProfileImage: String!{
        get{
            if dieticianImage == nil{
                dieticianImage = ""
            }
            return dieticianImage
        }
        set(newValue){
            dieticianImage =  "\(newValue)"
        }
    }
    init(){
}
}