//
//  ConnectionClass.swift
//  SkyPatrol
//
//  Created by Chetu-macmini-26 on 22/09/15.
//  Copyright (c) 2015 Skypatrol////

//

import UIKit

class ConnectionClass: NSObject {
    
// method to call Patient Login
/***********************************************************************************************************
    <Name>ServiceForPatient Login </Name>
    <Input Type> url Type (POST request) </Input Type>
    <Return>  </Return>
    <Purpose>This class method is used to make a request for login service and provide data to completion handler</Purpose>
    <History>
    <Header> Version 1.0 </Header>
    <Date> 26/march/2016 </Date>
    </History>
***********************************************************************************************************/
 class  func patientLoginServiceImplementation(json:NSDictionary, withUrlString urlString:String, completion: (data: NSData?, error: NSError?)->Void){
     let completeUrl =  "\(baseUrl)\(urlString)"
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
            // create post request
            let url = NSURL(string: completeUrl)!
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            // insert json data to the request
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = jsonData
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
                if error != nil{
                    completion(data: nil, error: error)
                  //  print("Error -> \(error)")
                }
               
               //     let result = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String:AnyObject]
                    // here we get the data
                    completion(data: data, error: nil)
                    //print("Result -> \(result)"
            }
            task.resume()
        } catch {
            // catch excepton in service calling
            print(error)
        }
    }
    
}
