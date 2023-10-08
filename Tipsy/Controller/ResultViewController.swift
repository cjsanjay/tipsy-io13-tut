//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Sanjay Singh on 03/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultBill: UILabel!
    @IBOutlet weak var resultMessage: UILabel!
    
    var resultBillValue: String?
    var numPeople: Int?
    var tipPercentage: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultBill.text = resultBillValue
        resultMessage.text = "Split between \(numPeople ?? 2) with \(tipPercentage ?? 10)% tip."
        
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
