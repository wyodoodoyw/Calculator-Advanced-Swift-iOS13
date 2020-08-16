//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - displayLabel
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    
    private var displayValue: Double {
        
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert displayLabel.text to Double")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    // MARK: - calcBUttonPressed
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTyping = true
        
        if let calcMethod = sender.currentTitle {
            let calculator = CalculatorLogic(number: displayValue)
            
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("The result of the calculation is nil.")
            }
            displayValue = result
        }
        
    
    }

 
    // MARK: - numButtonPressed
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                
                if numValue == "." {

                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text?.append(numValue)
            }
            
        }
        
    
    }

}

