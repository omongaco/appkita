//
//  ViewController.swift
//  KitaTest
//
//  Created by Ansyar Hafid on 08/05/19.
//  Copyright © 2019 Ansyar Hafid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sumXField: UITextField!
    @IBOutlet weak var sumYField: UITextField!
    @IBOutlet weak var multiplyXField: UITextField!
    @IBOutlet weak var multiplyYField: UITextField!
    @IBOutlet weak var primeField: UITextField!
    @IBOutlet weak var fibField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = APP_NAME
    }
    
    @IBAction func calculateResult(_ sender: AnyObject) {
        guard let button = sender as? UIButton else {return}
        
        switch button.tag {
        case 0:
            let xString = sumXField.text ?? "0"
            let yString = sumYField.text ?? "0"
            let xNumber = Int(xString) ?? 0
            let yNumber = Int(yString) ?? 0
            
            self.summarize(x: xNumber, y: yNumber)
            
        case 1:
            let xString = multiplyXField.text ?? "0"
            let yString = multiplyYField.text ?? "0"
            let xNumber = Int(xString) ?? 0
            let yNumber = Int(yString) ?? 0
            
            self.multiply(x: xNumber, y: yNumber)
            
        case 2:
            let nString = primeField.text ?? "0"
            let nNumber = Int(nString) ?? 0
            
            self.nPrimeNumber(n: nNumber)
            
        case 3:
            let nString = fibField.text ?? "0"
            let nNumber = Int(nString) ?? 0
            
            self.nFibonacciNumber(n: nNumber)
            
        default:
            break
        }
        
        clearFields(exc: button.tag)
    }
    
    func clearFields(exc: Int) {
        sumXField.text = exc == 0 ? sumXField.text : "0"
        sumYField.text = exc == 0 ? sumYField.text : "0"
        multiplyXField.text = exc == 1 ? multiplyXField.text : "0"
        multiplyYField.text = exc == 1 ? multiplyYField.text : "0"
        primeField.text = exc == 2 ? primeField.text : "0"
        fibField.text = exc == 3 ? fibField.text : "0"
    }
    
    func summarize(x: Int, y: Int) {
        let resultString = String(x + y)
        self.resultLabel.text = resultString
    }
    
    func multiply(x: Int, y: Int) {
        let resultString = String(x * y)
        self.resultLabel.text = resultString
    }
    
    func nPrimeNumber(n: Int) {
        let max = 100
        var numbers = [Int](2 ..< max)
        for i in 0..<max - 2 {
            let prime = numbers[i]
            guard prime > 0 else { continue }
            for multiple in stride(from: 2 * prime - 2, to: max - 2, by: prime){
                numbers[multiple] = 0
            }
        }
        
        let nNumbers = numbers.filter{ $0 > 0 }
        
        self.resultLabel.text = nNumbers.prefix(n).description
    }
    
    func nFibonacciNumber(n: Int) {
        assert(n > 1)
        var array = [0, 1]
        
        while array.count < n {
            array.append(array[array.count - 1] + array[array.count - 2])
        }
        
        self.resultLabel.text = array.description
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        
        return true
    }
}

