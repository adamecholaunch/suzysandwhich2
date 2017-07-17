//
//  ExampleProblems.swift
//  SAT Math
//
//  Created by Adam Buys on 7/15/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import Foundation
import ParseUI


let label1 = "${x}^{2} - 4 = 0$"
let text2 = "What are the solutions to the equations above?"
let mcA = "$n$"
let mcB = "$4$"
let mcC = "$x = 3"
let mcD = "$\\begin{gather} \\dot{x} = \\sigma(y-x) \\\\ \\dot{y} = \\rho x - y - xz \\\\ \\dot{z} = -\\beta z + xy\" \\end{gather}"
let solution = 1
let partsCount = 2
let choicesCount = 4
let problemType = 0
let img = UIImage(named: "LinearChart")
let text1 = "Some values of the linear function f are shown in the table above. Which of the following defines f ?"

let mcA1 = "$f(x) = 2x + 3$"
let mcB1 = "$f(x) = 3x + 2$"
let mcC1 = "$f(x) = 4x + 1$"
let mcD1 = "$f(x) = 5x$"

class ExampleProblems {
    



    let problem1 = Problem(label1: label1, label2: nil, label3: nil, image1: nil, image2: nil, textfield1: text2, textfield2: nil, textfield3: nil, mcA: mcA, mcAcorrect: true, mcB: mcB, mcBcorrect: false, mcC: mcC, mcCcorrect: false, mcD: mcD, mcDcorrect: false, mcE: nil, mcEcorrect: false, solution: solution,  probStyle: ["L", "T"], choicesCount: choicesCount, problemType: problemType, numInSet: "1/20")


    let problem2 = Problem(label1: nil, label2: nil, label3: nil, image1: img, image2: nil, textfield1: text1, textfield2: nil, textfield3: nil, mcA: mcA1, mcAcorrect: true, mcB: mcB1, mcBcorrect: false, mcC: mcC1, mcCcorrect: false, mcD: mcD1, mcDcorrect: false, mcE: nil, mcEcorrect: false, solution: 1, probStyle: ["I", "T"], choicesCount: 4, problemType: 2, numInSet: "2/20")


}






