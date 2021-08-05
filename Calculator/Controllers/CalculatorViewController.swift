//
//  ViewController.swift
//  Calculator
//
//  Created by Binaya on 08/05/2021.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    private var userIsFinishedTyping = true
    
    private var resultLabelValue: Double {
        
        get {
            guard let resultAsDouble = Double(resultLabel.text!) else {
                fatalError("Could not covert the display label text to a double.")
            }
            return resultAsDouble
        }
        
        set {
            if floor(newValue) == newValue {
                resultLabel.text = String(Int(newValue))
            }else {
                resultLabel.text = String(newValue)
            }
        }
        
    }
    
    private var calculatorLogic = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction methods

    @IBAction func numberButtonPressed(_ sender: UIButton) {

        if userIsFinishedTyping {
            
            resultLabel.text = sender.currentTitle
            userIsFinishedTyping = false
            
        }else {
            
            if !resultLabel.text!.contains(".") {
                resultLabel.text?.append(sender.currentTitle!)
            }else if resultLabel.text!.contains(".") && sender.currentTitle! != "." {
                resultLabel.text?.append(sender.currentTitle!)
            }
            
        }
        
    }
     
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        if resultLabel.text! == "." {
            return
        }
        
        userIsFinishedTyping = true
        
        calculatorLogic.setResult(with: resultLabelValue)
                
        let calculateButtonTitle = sender.currentTitle!
        
        guard let result = calculatorLogic.calculate(with: calculateButtonTitle) else {
            fatalError("Calculate method returned with a nil instead of a result!")
        }
        
        resultLabelValue = result
        
    }
}

