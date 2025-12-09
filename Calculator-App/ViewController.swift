//
//  ViewController.swift
//  Calculator-App
//
//  Created by Tejasv Singh on 12/8/25.
//

import UIKit

class ViewController: UIViewController {
    var firstNum: String = ""
    var operation: String = ""
    var secondNum: String = ""
    var haveresult: Bool = false
    var resultNumber: String = ""
    var numberAfterResult: String = ""
    @IBAction func add(_ sender: Any) {
        operation = "+"
    }
    
    @IBAction func subtract(_ sender: Any) {
        operation = "-"
    }
    
    @IBAction func multiply(_ sender: Any) {
        operation = "x"
    }
    
    @IBAction func divide(_ sender: Any) {
        operation = "/"
    }
    
    
    @IBAction func equals(_ sender: Any) {
        resultNumber = String(doOperation())
        let numArray = resultNumber.components(separatedBy: ".")
        if numArray[1] == "0"{
            numOnScreen.text = numArray[0]
        }
        else{
            numOnScreen.text = resultNumber
        }
      
        numberAfterResult = ""
    }
    
    @IBOutlet weak var numOnScreen: UILabel!
    
   // @IBOutlet var calcButtons: [UIButton]!
    @IBOutlet var calcButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for button in calcButtons{
            button.layer.cornerRadius = button.frame.size.height/2;
            button.titleLabel?.font = UIFont(name:"System", size: 24)
        }
        
    }
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         
         for button in calcButtons {
             button.layer.cornerRadius = button.frame.size.height / 2
         }
     }

    @IBAction func numPressed(_ sender: UIButton) {
        if operation == ""{
            firstNum += String(sender.tag)
            numOnScreen.text = firstNum
        }
        else if operation != "" && !haveresult{
            secondNum += String(sender.tag)
            numOnScreen.text = secondNum
        }
        else if operation != "" && haveresult{
            numberAfterResult += String(sender.tag)
            numOnScreen.text = numberAfterResult
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        haveresult = false
        numOnScreen.text = "0"
        firstNum = ""
        operation = ""
        secondNum = ""
        resultNumber = ""
        numberAfterResult = ""
    }
    func doOperation() -> Double{
        if operation == "+"{
            if !haveresult{
                haveresult = true
                return Double(firstNum)! + Double(secondNum)!
            }
            else{
                return Double(resultNumber)! + Double(numberAfterResult)!
            }
        }
        else if operation == "-"{
            if !haveresult{
                haveresult = true
                return Double(firstNum)! - Double(secondNum)!
            }
            else{
                return Double(resultNumber)!-Double(numberAfterResult)!
            }
        }
       else if operation == "x"{
            if !haveresult{
                haveresult = true
                return Double(firstNum)! * Double(secondNum)!
            }
            else{
                return Double(resultNumber)! * Double(numberAfterResult)!
            }
        }
        else if operation == "/"{
            if !haveresult{
                haveresult = true
                return Double(firstNum)! / Double(secondNum)!
            }
            else{
                return Double(resultNumber)!/Double(numberAfterResult)!
            }
        }
        return 0
    }
}

