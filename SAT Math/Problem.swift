//
//  Problems.swift
//  SAT Math
//
//  Created by Adam Buys on 6/19/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import Foundation
import ParseUI




class Problem {
    
    let label1 : String?
    let label2 : String?
    let label3 : String?
    let image1 : UIImage?
    let image2 : UIImage?
    let textfield1 : String?
    let textfield2 : String?
    let textfield3 : String?
    let mcA : (str : String?, correct: Bool?)?
    let mcB : (str : String?, correct: Bool?)?
    let mcC : (str : String?, correct: Bool?)?
    let mcD : (str : String?, correct: Bool?)?
    let mcE : (str : String?, correct: Bool?)?
    let solution : Int // 0 to 4 for A to E
    let probStyle : Array<String>?
    let choicesCount : Int
    let problemType : Int
    let numInSet : String?
    
    
    required init(label1 : String?, label2 : String?, label3 : String?, image1: UIImage?, image2 : UIImage?, textfield1 : String?,  textfield2 : String?, textfield3 : String?, mcA : String?, mcAcorrect: Bool?,  mcB : String?, mcBcorrect: Bool?, mcC : String?, mcCcorrect: Bool?, mcD : String?, mcDcorrect: Bool?, mcE : String?, mcEcorrect: Bool?, solution : Int, probStyle : Array<String>?, choicesCount : Int, problemType : Int, numInSet : String?) {
        
        
     
        self.label1 = label1
        self.label2 = label2
        self.label3 = label3
        self.image1 = image1
        self.image2 = image2
        self.textfield1 = textfield1
        self.textfield2 = textfield2
        self.textfield3 = textfield3
        self.mcA = (mcA, mcAcorrect)
        self.mcB = (mcB, mcBcorrect)
        self.mcC = (mcC, mcCcorrect)
        self.mcD = (mcD, mcDcorrect)
        self.mcE = (mcE, mcEcorrect)
        self.solution = solution
        self.probStyle = probStyle!
        self.choicesCount = choicesCount
        self.problemType = problemType
        self.numInSet = numInSet
        
        //super.init()
    }
    
}



