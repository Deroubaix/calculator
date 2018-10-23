//
//  ViewController.swift
//  calculator
//
//  Created by Marisha Deroubaix on 26/09/18.
//  Copyright © 2018 Marisha Deroubaix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var resultLabel: UILabel!
  
  private var doneTypingNumber: Bool = true
  
  private var displayValue: Double {
    get {
      guard let number = Double(resultLabel.text!) else {
        fatalError("Cannot convert display label text to a double")
      }
      return number
    }
    set {
      resultLabel.text = String(newValue)
    }
  }
  
  private var calculator = CalculatorLogic()
  
  @IBAction func calculationPressed(_ sender: UIButton) {
    
    doneTypingNumber = true
    calculator.setNumber(displayValue)
    
    if let calcMethod = sender.currentTitle {
      if let result = calculator.calculate(symbol: calcMethod) {
        displayValue = result
      }
    }
  }
  
  @IBAction func numberPressed(_ sender: UIButton) {
    if let numValue = sender.currentTitle {
      
      if doneTypingNumber {
        resultLabel.text = numValue
        doneTypingNumber = false
      } else {
        
        if numValue == "." {
          
          let isInt = floor(displayValue) == displayValue
          if !isInt {
            return
          }
        }
        resultLabel.text = resultLabel.text! + numValue
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}

