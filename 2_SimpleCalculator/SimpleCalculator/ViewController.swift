//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Bora Aksoy on 8.12.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstİnput: UITextField!
    @IBOutlet weak var secondİnput: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sumClicked(_ sender: Any) {
        if let firstNumber = Int(firstİnput.text!){
            if let secondNumber = Int(secondİnput.text!){
                result = firstNumber + secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    
    @IBAction func minusClicked(_ sender: Any) {
        if let firstNumber = Int(firstİnput.text!){
            if let secondNumber = Int(secondİnput.text!){
                result = firstNumber - secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    
    @IBAction func multipleClicked(_ sender: Any) {
        if let firstNumber = Int(firstİnput.text!){
            if let secondNumber = Int(secondİnput.text!){
                result = firstNumber * secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    
    @IBAction func divideClicked(_ sender: Any) {
        if let firstNumber = Int(firstİnput.text!){
            if let secondNumber = Int(secondİnput.text!){
                result = firstNumber / secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    
}

