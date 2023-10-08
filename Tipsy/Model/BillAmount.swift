//
//  Tip.swift
//  Tipsy
//
//  Created by Sanjay Singh on 03/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct BillAmount {
    var billInput: Double = 0.0
    var tipPercentage: Double = 0.0
    var numberOfPeople: Int = 0
    
    func getNumberOfPeople() -> Int {
        return self.numberOfPeople
    }
    
    mutating func updateNumberOfPeople(value: Int) {
        self.numberOfPeople = value
    }
    
    func calculateSplit() -> Double {
        print ("billInput: \(self.billInput), tipPercentage: \(self.tipPercentage), numberOfPeople: \(self.numberOfPeople)")
        if self.numberOfPeople == 0 {
            return 0.0
        }
        return ((self.billInput * self.tipPercentage)+self.billInput)/Double(self.numberOfPeople)
    }
}
