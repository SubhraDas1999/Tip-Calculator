//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    var selectedPercentage: Float = 0.0
    var totalBillAmount: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let buttons = [zeroPctButton, tenPctButton, twentyPctButton]
        
        for button in buttons {
            button?.isSelected = (button == sender)
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if zeroPctButton.isSelected {
            selectedPercentage = 0.0
        } else if tenPctButton.isSelected {
            selectedPercentage = 0.1
        } else if twentyPctButton.isSelected {
            selectedPercentage = 0.2
        }
        
        let billValue = billAmount.text ?? "0.0"
        let floatBillvalue = Float(billValue)
        
        let split = splitNumberLabel.text ?? "0.0"
        let floatSplit = Float(split)
        
        totalBillAmount = ((floatBillvalue ?? 0.0) + ((floatBillvalue ?? 0.0) * selectedPercentage)) / (floatSplit ?? 0.0)
        
        print(totalBillAmount)
        
        self.performSegue(withIdentifier: "calculateSplitSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "calculateSplitSegue" {
                if let resultsVC = segue.destination as? ResultsViewController {
                    resultsVC.totalBillAmount = totalBillAmount
                    resultsVC.selectedPercentage = selectedPercentage
                    resultsVC.peopleCount = Int(splitNumberLabel.text ?? "0") ?? 1
                }
            }
        }
}

