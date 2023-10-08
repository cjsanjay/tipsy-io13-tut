//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var scb = SplitCalculateBrain()

    @IBOutlet weak var tipTwenty: UIButton!
    @IBOutlet weak var tipTen: UIButton!
    @IBOutlet weak var tipZero: UIButton!
    
    @IBOutlet weak var numPeopleStepper: UIStepper!
    @IBOutlet weak var billInputField: UITextField!
    @IBOutlet weak var numPeopleCounr: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scb.setTipPercentage(tipPercentage: 0.1)
        scb.setNumberOfPeople(numberOfPeople: 2)
        numPeopleStepper.value = 2
        numPeopleCounr.text = "2"
    }
    
    @IBAction func BillInputComplete(_ sender: UITextField) {
        if sender.text == nil {
            scb.setBill(billInput: Double(0.0))
        } else {
            scb.setBill(billInput: Double(sender.text ?? "0.0")!)
        }
    }
    
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        var tipPercentage = 0.0
        updateUI()
        billInputField.resignFirstResponder()
        if sender.titleLabel?.text == "0%" {
            tipPercentage = 0.0
            tipZero.isSelected = true
        }
        if sender.titleLabel?.text == "10%" {
            tipPercentage = 0.1
            tipTen.isSelected = true
        }
        if sender.titleLabel?.text == "20%" {
            tipPercentage = 0.2
            tipTwenty.isSelected = true
        }
        scb.setTipPercentage(tipPercentage: tipPercentage)
    }
    

    @IBAction func steppedPressed(_ sender: UIStepper) {
        billInputField.resignFirstResponder()
        scb.updateNumberOfPeople(value: Int(sender.value))
        numPeopleCounr.text = String(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        scb.calculateSplit()
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultView = segue.destination as! ResultViewController
            resultView.resultBillValue = String(format: "%.2f", self.scb.getSplitValue())
            resultView.numPeople = self.scb.getNumberOfPeople()
            resultView.tipPercentage = Int(self.scb.getTipPercentage() * 100)
        }
    }
    
    func updateUI() {
        tipZero.isSelected = false
        tipTen.isSelected = false
        tipTwenty.isSelected = false
    }
    
}

