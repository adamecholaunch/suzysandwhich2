//
//  CalculatorVC.swift
//  SAT Math
//
//  Created by Adam Buys on 7/12/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit
import Foundation


class CalculatorVC: UIViewController {
    
    
    @IBOutlet weak var displayLabel: UILabel!

    var inCalculation = false
    var useFloat1 = false
    var useFloat2 = false
    var justCompletedACalc = false
    
    var currentNumInt : Int = 0
    var currentNumFloat : Float? = nil
    var prevNumberInt : Int = 0
    var prevNumberFloat : Float? = nil
    var newNumberInt : Int? = nil
    var newNumberFloat : Float? = nil
    
    var justCleared = true
    var operation = ""
    let pieConstant = Float(3.14159)
    
    @IBAction func numberBtnPressed(_ sender: UIButton) {
        
            let btn = sender
            //let numAsFloat = Float(btn.titleLabel!.text!)!
            let numAsInt = Int(btn.titleLabel!.text!)!
        
        
        if justCompletedACalc {
            
            clearFunction((Any).self)
            currentNumInt = numAsInt
            prevNumberInt = currentNumInt
            justCompletedACalc = false
            displayLabel.text = String(currentNumInt)
            
            
        }
        
            // good up until this point
        
        else if inCalculation && !useFloat2 && newNumberInt == nil {
            
            currentNumInt = numAsInt
            newNumberInt = currentNumInt
            
            displayLabel.text = String(currentNumInt)
            
            
        }
        
        else if inCalculation && !useFloat2 {
            
            currentNumInt = mergeNumsInt(num1: newNumberInt!, num2: numAsInt)
            newNumberInt = currentNumInt
            
            displayLabel.text = String(currentNumInt)
            
        }
            
        else if inCalculation && newNumberFloat == nil {
            
            if newNumberInt != nil {
                
                let tempFloat = convertIntToFloat(i: newNumberInt!)
                let newFloat = convertIntToFloat(i: numAsInt) * 0.1 // to adjust
                
                currentNumFloat = tempFloat + newFloat
                newNumberFloat = currentNumFloat
                
                
            } else {
                
                print("SHOOULDNT BE HERE")
                
            }
            
           
            displayLabel.text = String(currentNumFloat!)
        }
            
        else if inCalculation {
            
            currentNumFloat = mergeNumsFloat(num1: prevNumberFloat!, num2: numAsInt)
            newNumberFloat = currentNumFloat
            
            displayLabel.text = String(currentNumFloat!)
        }
            
            
        
        
        else {
            
            
            if justCleared {
                
                currentNumInt = numAsInt
                prevNumberInt = currentNumInt
                justCleared = false
                justCompletedACalc = false
                
                displayLabel.text = String(currentNumInt)
                
                
                
            } else if !useFloat1 {
                
                currentNumInt = mergeNumsInt(num1: prevNumberInt, num2: numAsInt)
                prevNumberInt = currentNumInt
                
                displayLabel.text = String(currentNumInt)
                
            } else {
                
                if currentNumFloat == nil {
                    
                    
                    let tempFloat = convertIntToFloat(i: prevNumberInt)
                    let newFloat = convertIntToFloat(i: numAsInt) * 0.1 // to adjust
                    
                    
                    currentNumFloat = tempFloat + newFloat
                    prevNumberFloat = currentNumFloat
                    newNumberFloat = currentNumFloat
                    
                    displayLabel.text = String(currentNumFloat!)
                    
                }
                
                else {
                    
                    currentNumFloat = mergeNumsFloat(num1: prevNumberFloat!, num2: numAsInt)
                    prevNumberFloat = currentNumFloat!
                    
                    displayLabel.text = String(currentNumFloat!)
                    
                }
                
                
            }
            

            
        }
        
        
    }
    
    
    // good
    @IBAction func switchToFloatDecimal(_ sender: UIButton) {
        
        if inCalculation {
            if !useFloat2 {
                useFloat2 = true
                
                let currentText = displayLabel.text!
                let newText = currentText + "."
                displayLabel.text = newText
            }
        } else {
            if !useFloat1 {
                useFloat1 = true
                
                let currentText = displayLabel.text!
                let newText = currentText + "."
                displayLabel.text = newText
                
            }
        }
        
    }
    
    // good
    @IBAction func plusMinus(_ sender: UIButton) {
        
        if inCalculation {
            
            if useFloat2 {
                currentNumFloat = -1 * newNumberFloat!
                newNumberFloat = currentNumFloat
                displayLabel.text = String(currentNumFloat!)
            
            }
            
            else {
                currentNumInt = -1 * newNumberInt!
                newNumberInt = currentNumInt
                displayLabel.text = String(currentNumInt)
            }
            
        } else {
            
            if useFloat1 {
            
                currentNumFloat = -1 * prevNumberFloat!
                prevNumberFloat = currentNumFloat!
                displayLabel.text = String(currentNumFloat!)
                
            }
            else {
                
                currentNumInt = -1 * prevNumberInt
                prevNumberInt = currentNumInt
                displayLabel.text = String(currentNumInt)
            }
        }
        
    }
    
    
    @IBAction func xsquared(_ sender: UIButton) {
        
        if !inCalculation {
            
            if useFloat1 {
                
                if prevNumberFloat != nil {
                    
                    let answerFloat = prevNumberFloat! * prevNumberFloat!
                    
                    currentNumFloat = answerFloat
                    prevNumberFloat = answerFloat
                    displayLabel.text = String(currentNumFloat!)
                }
            }
            
           
                
            else {
                
                let answerInt = prevNumberInt * prevNumberInt
                
                currentNumInt = answerInt
                prevNumberInt = answerInt
                displayLabel.text = String(currentNumInt)
            }
            

        }
        
    }
    
    
    
    @IBAction func sinFunction(_ sender: UIButton) {
        
        if !inCalculation {
            
            if useFloat1 {
                
                if prevNumberFloat != nil {
                    
                    let answerFloat = sin(prevNumberFloat!)
                    
                    currentNumFloat = answerFloat
                    prevNumberFloat = answerFloat
                    displayLabel.text = String(currentNumFloat!)
                }
            }
                
                
                
            else {
                
                let answerFloat = sin(Float(prevNumberInt))
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                displayLabel.text = String(currentNumFloat!)
                useFloat1 = true
            }
            
            
        }
    }
    
    @IBAction func cosFunction(_ sender: UIButton) {
        if !inCalculation {
            
            if useFloat1 {
                
                if prevNumberFloat != nil {
                    
                    let answerFloat = cos(prevNumberFloat!)
                    
                    currentNumFloat = answerFloat
                    prevNumberFloat = answerFloat
                    displayLabel.text = String(currentNumFloat!)
                }
            }
                
                
                
            else {
                
                let answerFloat = cos(Float(prevNumberInt))
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                displayLabel.text = String(currentNumFloat!)
                useFloat1 = true
            }
            
            
        }
    }
    
    
    
    
    
    
    @IBAction func PieFunction(_ sender: UIButton) {
        
        if inCalculation {
            
            newNumberFloat = pieConstant
            currentNumFloat = pieConstant
            useFloat2 = true
            
            displayLabel.text = String(currentNumFloat!)
            
            
        } else {
            
            currentNumFloat = pieConstant
            prevNumberFloat = pieConstant
            useFloat1 = true
            
            displayLabel.text = String(currentNumFloat!)
            
            
            
            
        }
    }
    
    
    @IBAction func squareRoot(_ sender: UIButton) {
        
        if !inCalculation {
            
            if useFloat1 {
                
                if prevNumberFloat != nil {
                    
                    let answerFloat = prevNumberFloat!.squareRoot()
                    
                    currentNumFloat = answerFloat
                    prevNumberFloat = answerFloat
                    displayLabel.text = String(currentNumFloat!)
                }
            }
                
                
                
            else {
                
                let answerFloat = Float(prevNumberInt).squareRoot()
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                displayLabel.text = String(currentNumFloat!)
                useFloat1 = true
            }
            
            
        }

        
    }
    
    // good
    @IBAction func division(_ sender: UIButton) {
        operation = "division"
        inCalculation = true
        justCompletedACalc = false
    }
    
    // good
    @IBAction func multiply(_ sender: UIButton) {
        operation = "multiply"
        inCalculation = true
        justCompletedACalc = false
    }
    
    // good
    @IBAction func subtract(_ sender: UIButton) {
        operation = "subtract"
        inCalculation = true
        justCompletedACalc = false
    }
    
    // good
    @IBAction func add(_ sender: UIButton) {
        operation = "add"
        inCalculation = true
        justCompletedACalc = false
    }
    
   
    @IBAction func equalsFunction(_ sender: UIButton) {
        
       
        if operation == "add"
        {
            addCalled()
        }
         
        
        
        if operation == "subtract"
        {
           subtractCalled()
        }
        
        
        if operation == "multiply"
        {
            multiplyCalled()
            
        }
        
        
        if operation == "division"
        {
            divideCalled()
        }
        
        if operation == "x2y"
        {
            x2yCalled()
        }
        
        
        
        
        operation = ""
        inCalculation = false
        justCompletedACalc = true
        useFloat2 = false
        newNumberInt = nil
        newNumberFloat = nil
       
        
    }
    
    
    // good
    @IBAction func clearFunction(_ sender: Any) {
        
        useFloat1 = false
        useFloat2 = false
        
        
        currentNumInt = 0
        currentNumFloat = nil
        prevNumberInt = -10000000000
        prevNumberFloat = nil
        newNumberInt = nil
        newNumberFloat = nil
        
        justCleared = true
        inCalculation = false
        justCompletedACalc = false
        
        displayLabel.text = String(currentNumInt)
    }
    
    
    
    @IBAction func x2y(_ sender: UIButton) {
        operation = "x2y"
        inCalculation = true
        justCompletedACalc = false
    }
    
    
    // good
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        

    }
    
    // good
    func mergeNumsFloat(num1: Float, num2: Int) -> Float {
        
        let numero1 = String(num1)
        let numero2 = String(num2)
        
  
        let newnumero = numero1 + numero2
        
        return Float(newnumero)!
    }
    
    // good
    func mergeNumsInt(num1: Int, num2: Int) -> Int {
        
        let numero1 = String(num1)
        let numero2 = String(num2)
        
        let newnumero = numero1 + numero2
        
        return Int(newnumero)!
    }
    
    // good
    func convertIntToFloat(i : Int) -> Float {
        let str = String(i) + ".0"
        return Float(str)!
    }
    
    func addCalled() {
        if newNumberFloat != nil {
            
            if useFloat1 {
                
                let answerFloat = newNumberFloat! + prevNumberFloat!
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(answerFloat)
                
            } else {
                
                let tempFloat = convertIntToFloat(i: prevNumberInt)
                let answerFloat = tempFloat + newNumberFloat!
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(answerFloat)
                
            }
        }
            
        else if newNumberInt != nil {
            
            if useFloat1 {
                
                let tempFloat = convertIntToFloat(i: newNumberInt!)
                let answerFloat = tempFloat + prevNumberFloat!
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(currentNumFloat!)
                
                
                
            } else {
                
                let answerInt = prevNumberInt + newNumberInt!
                
                currentNumInt = answerInt
                prevNumberInt = answerInt
                displayLabel.text = String(currentNumInt)
                useFloat1 = false
            }
            
        }

    }
    
    func subtractCalled() {
        if newNumberFloat != nil {
            
            if useFloat1 {
                
                let answerFloat = newNumberFloat! - prevNumberFloat!
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(answerFloat)
                
            } else {
                
                let tempFloat = convertIntToFloat(i: prevNumberInt)
                let answerFloat = tempFloat - newNumberFloat!
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(answerFloat)
                
            }
        }
            
        else if newNumberInt != nil {
            
            if useFloat1 {
                
                let tempFloat = convertIntToFloat(i: newNumberInt!)
                let answerFloat = prevNumberFloat! - tempFloat
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(currentNumFloat!)
                
                
                
            } else {
                
                let answerInt = prevNumberInt - newNumberInt!
                
                currentNumInt = answerInt
                prevNumberInt = answerInt
                displayLabel.text = String(currentNumInt)
                useFloat1 = false
            }
            
        }

    }
    
    func multiplyCalled() {
        
        if newNumberFloat != nil {
            
            if useFloat1 {
                
                let answerFloat = newNumberFloat! * prevNumberFloat!
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(answerFloat)
                
            } else {
                
                let tempFloat = convertIntToFloat(i: prevNumberInt)
                let answerFloat = tempFloat * newNumberFloat!
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(answerFloat)
                
            }
        }
            
        else if newNumberInt != nil {
            
            if useFloat1 {
                
                let tempFloat = convertIntToFloat(i: newNumberInt!)
                let answerFloat = prevNumberFloat! * tempFloat
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(currentNumFloat!)
                
                
                
            } else {
                
                let answerInt = prevNumberInt * newNumberInt!
                
                currentNumInt = answerInt
                prevNumberInt = answerInt
                displayLabel.text = String(currentNumInt)
                useFloat1 = false
            }
            
        }
        
    }
    
    func divideCalled() {
        
        if newNumberFloat != nil {
            
            if useFloat1 {
                
                let answerFloat =  Float(prevNumberFloat! / newNumberFloat!)
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(answerFloat)
                
            } else {
                
                let tempFloat = convertIntToFloat(i: prevNumberInt)
                let answerFloat = Float(newNumberFloat! / tempFloat)
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(answerFloat)
                
            }
        }
            
        else if newNumberInt != nil {
            
            if useFloat1 {
                
                let tempFloat = convertIntToFloat(i: newNumberInt!)
                let answerFloat = Float(tempFloat / prevNumberFloat!)
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(currentNumFloat!)
                
                
                
            } else {
                
                let answerFloat : Float = Float(Float(prevNumberInt) / Float(newNumberInt!))
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                displayLabel.text = String(currentNumFloat!)
                useFloat1 = true
            }
            
        }
        
    }
    
    func x2yCalled() {
        
        if newNumberFloat != nil {
            
            if useFloat1 {
                
                let answerFloat =  powf(prevNumberFloat!, newNumberFloat!)
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(answerFloat)
                
            } else {
                
                let tempFloat = convertIntToFloat(i: prevNumberInt)
                let answerFloat = powf(tempFloat, newNumberFloat!)
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(answerFloat)
                
            }
        }
            
        else if newNumberInt != nil {
            
            if useFloat1 {
                
                let tempFloat = convertIntToFloat(i: newNumberInt!)
                let answerFloat = powf(tempFloat, newNumberFloat!)
                
                currentNumFloat = answerFloat
                prevNumberFloat = answerFloat
                
                displayLabel.text = String(currentNumFloat!)
                
                
                
            } else {
                
                let tempFloat1 = convertIntToFloat(i: prevNumberInt)
                let tempFloat2 = convertIntToFloat(i: newNumberInt!)
                let answerInt = Int(powf(tempFloat1, tempFloat2))
                    
                currentNumInt = answerInt
                prevNumberInt = answerInt
                displayLabel.text = String(currentNumInt)
                useFloat1 = false
            }
            
        }
    }

 

}
