//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Binaya on 04/08/2021.
//

import Foundation

struct CalculatorLogic {
    
    private var result: Double?
    private var firstNumAndOperation: (num1: Double, operation: String)?
    
    mutating func setResult(with result: Double) {
        self.result = result
    }
    
    mutating func calculate (with symbol: String) -> Double? {
                        
        var validResult: Double?
        
        if let r = result {
                        
            switch symbol {
            case "AC":
                validResult = 0.0
                break
            case "+/-":
                validResult = r * -1
                break
            case "%":
                validResult = r * 0.01
                break
            case "=":
                validResult = performFullCalculation(with: r)
                break
            default:
                validResult = r
                firstNumAndOperation = (num1: r, operation: symbol)
            }
            
        }
        
        return validResult
    }
    
    private mutating func performFullCalculation (with secondNum: Double) -> Double {
        
        var result = 0.0
        
        if let intermediateCalculation = firstNumAndOperation {
            
            let operation = intermediateCalculation.operation
            
            if operation == "+" {
                result = intermediateCalculation.num1 + secondNum
            }else if operation == "-" {
                result = intermediateCalculation.num1 - secondNum
            }else if operation == "÷" {
                result = intermediateCalculation.num1 / secondNum
            }else {
                result = intermediateCalculation.num1 * secondNum

            }
            
        }else {
            
            // If user presses one num and hits "="
            result = secondNum
            
        }
        
        firstNumAndOperation = nil
        
        return result
        
    }
    
}
