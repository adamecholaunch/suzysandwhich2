//
//  QuestLatexLabelTVC.swift
//  SAT Math
//
//  Created by Adam Buys on 7/15/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit
import iosMath

class QuestLatexLabelTVC: UITableViewCell {

    @IBOutlet weak var latexLabel: MTMathUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(latexString : String) {
        self.latexLabel.latex = latexString
    }

}
