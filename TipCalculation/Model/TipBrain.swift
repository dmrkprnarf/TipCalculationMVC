//
//  TipBrain.swift
//  TipCalculation
//
//  Created by Arif Demirkoparan on 17.01.2023.
//

import Foundation
import UIKit

struct TipBrain {
    
    var typePercent:String?
    var stepperValue:Double?
    var result:Double?
    
    mutating func getTypePercent(_ percent:String) -> String {
        typePercent = percent.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return typePercent!
    }
    
    mutating func getStepperValue(stepper:Double) -> Double{
        stepperValue = stepper
        return stepper
    }
    
    mutating func calculate(_ textfield:String?){
        
        if let safeTextfield = textfield , let safeTypePercent = typePercent , let safeStepper  = stepperValue  {
            let percent = (Double(safeTextfield)! * Double(safeTypePercent)!) / 100
            let result = (Double(safeTextfield)! + percent) / safeStepper
            self.result = result
        }
    }
    
    func checkİsSelected (_ sender: UIButton, _ zero:UIButton, _ ten:UIButton, _ twenty:UIButton) {
        switch sender {
        case zero:
            zero.isSelected = true
            ten.isSelected = false
            twenty.isSelected = false
        case ten:
            ten.isSelected = true
            zero.isSelected = false
            twenty.isSelected = false
        case twenty:
            twenty.isSelected = true
            zero.isSelected = false
            ten.isSelected = false
        default:
            print("Error")
        }
    }
}
