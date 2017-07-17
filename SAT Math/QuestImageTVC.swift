//
//  QuestImageTVC.swift
//  SAT Math
//
//  Created by Adam Buys on 7/15/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit

class QuestImageTVC: UITableViewCell {

    @IBOutlet weak var questionImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(img : UIImage) {
        
        self.questionImage.image = img
    }

}
