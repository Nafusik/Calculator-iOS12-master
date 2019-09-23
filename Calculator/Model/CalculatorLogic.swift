//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Francesca Koulikov on 9/23/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCaculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "AC":
                return 0
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                 intermediateCaculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCaculation?.n1,
            let operation = intermediateCaculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "×":
                return n1 * n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
            
            
        }
        return nil
    }
}
