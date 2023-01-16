//
//  ViewController.swift
//  TipCalculation
//
//  Created by Arif Demirkoparan on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    
    var tipBrain = TipBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        tipBrain.getTypePercent(sender.currentTitle!)
        tipBrain.checkİsSelected(sender, zeroButton, tenButton, twentyButton)
        view.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        personLabel.text = String(format: "%.f", tipBrain.getStepperValue(stepper: sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        tipBrain.calculate(textfield.text!)
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let secondVC = segue.destination as! ResultViewController
            secondVC.typePercent = tipBrain.typePercent
            secondVC.people = tipBrain.stepperValue
            secondVC.result = tipBrain.result
        }
    }
}
