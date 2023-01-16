//
//  ResultViewController.swift
//  TipCalculation
//
//  Created by Arif Demirkoparan on 16.01.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result:Double?
    var typePercent: String?
    var people:Double?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateUI () {
        
        if let safeResult = result , let safeTypePercent = typePercent , let safePeople = people{
            totalLabel.text = String(format: "%.2f", safeResult)
            settingLabel.text = "Split between \(String(format: "%.f", safePeople)) people with, \(safeTypePercent)% tip. "
        }
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}
