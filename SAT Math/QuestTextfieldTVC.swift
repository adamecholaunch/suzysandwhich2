//
//  QuestTextfieldTVC.swift
//  
//
//  Created by Adam Buys on 7/15/17.
//
//

import UIKit

class QuestTextfieldTVC: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(text : String) {
        
        self.textView.text = text
    }

}
