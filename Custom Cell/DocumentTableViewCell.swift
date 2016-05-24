//
//  DocumentTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 24/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
protocol DocumentSelection {
    func documentSelectionButtonTapped()
}
class DocumentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblCellHeader: UILabel!
    
    @IBOutlet weak var btnToGetImages: UIButton!
    var delegate:DocumentSelection!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func documentSelectionButtonTapped(sender: AnyObject) {
        
        delegate.documentSelectionButtonTapped()
    }
   
}
