//
//  DocumentSelectionPopUpViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 27/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
import AVFoundation
protocol removePopup {
    func RemoveSubViewfromSuperview()
    func cameraButtonTapped()
    func galleryButtonTapped()
}

class DocumentSelectionPopUpViewController: UIViewController {
    @IBOutlet weak var btnCamera: UIButton!

    @IBOutlet weak var btnGallery: UIButton!
    
    @IBOutlet weak var lblDescriptionText: UILabel!
    var delegate:removePopup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
lblDescriptionText.text = "Select document from the \n following option"
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // remove keyboard on tap
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)->() {
        resignFirstResponder()
        delegate.RemoveSubViewfromSuperview()
    }
    
    @IBAction func galleryBtnTappedAction(sender: AnyObject) {
      
        delegate.galleryButtonTapped()
    }
    
    @IBAction func cameraBtnTappedAction(sender: AnyObject) {
       
      delegate.cameraButtonTapped()
    }
    
       


}
