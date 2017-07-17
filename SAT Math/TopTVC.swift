//
//  TopTVC.swift
//  SAT Math
//
//  Created by Adam Buys on 6/19/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit

class TopTVC: UITableViewCell {

    
    @IBAction func draw(_ sender: Any) {
        nc.post(name: Notification.Name("drawOn"), object: nil)
    }
    
    @IBOutlet weak var problemNum: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
