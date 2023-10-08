//
//  TipCalculateBrain.swift
//  Tipsy
//
//  Created by Sanjay Singh on 03/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct SplitCalculateBrain {
    
    var splitAmount: Double?

    var bill = BillAmount()
    
    
    mutating func setBill(billInput: Double) {
        self.bill.billInput =  billInput
    }
    
    mutating func setTipPercentage(tipPercentage: Double) {
        self.bill.tipPercentage = tipPercentage
    }
    
    mutating func setNumberOfPeople(numberOfPeople: Int) {
        self.bill.numberOfPeople = numberOfPeople
    }
    
    func getNumberOfPeople() -> Int {
        return self.bill.getNumberOfPeople()
    }
    
    func getTipPercentage() -> Double {
        return self.bill.tipPercentage
    }
    
    mutating func updateNumberOfPeople(value: Int) {
        self.bill.updateNumberOfPeople(value: value)
    }
    
    mutating func calculateSplit() {
        self.splitAmount = self.bill.calculateSplit()
    }
    
    func getSplitValue() -> Double {
        return self.splitAmount ?? 0.0
    }
}
