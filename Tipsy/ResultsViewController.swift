//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Shubhra Das on 09/05/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var settingsLabel: UILabel!
       @IBOutlet weak var totalLabel: UILabel!
       
       var selectedPercentage: Float = 0.0
       var totalBillAmount: Float = 0.0
       var peopleCount: Int = 0
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           totalLabel.text = "\(totalBillAmount)"
           settingsLabel.text = "Split between \(peopleCount) people, with \(Int(selectedPercentage * 100))% tip."
       }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    

}
