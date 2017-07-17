//
//  Ma1TVC.swift
//  SAT Math
//
//  Created by Adam Buys on 6/20/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit
import iosMath

class Ma1TVC: UITableViewCell {

    
    @IBOutlet weak var totalview: UIView!
    @IBOutlet weak var letter: UILabel!
    @IBOutlet weak var answer1: MTMathUILabel!
    
    var correct = false
    
    func setUpCell(mc : MCChoice) {
        
        let green = UIColor(colorLiteralRed: 211/255.0, green: 211/255.0, blue: 211/255.0, alpha: 0.8)
        let cgGreen = green.cgColor
        self.totalview.layer.cornerRadius = 10
        self.totalview.layer.borderWidth = 1
        self.totalview.layer.borderColor = cgGreen
        self.totalview.clipsToBounds = true
        
        self.answer1.font = MTFontManager().termesFont(withSize: 17)
        self.answer1.latex = mc.latexString
        self.letter.text = mc.letter
        self.correct = mc.correct
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
