//
//  ConverterViewController.swift
//  ConversionCalculator
//
//  Created by Wade Tobin on 11/9/17.
//  Copyright © 2017 Wade Tobin. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    var inputValueString: String = ""
    var outputValueString: String = ""
    var from = " "
    var unitOn = 0
    
    
    @IBOutlet weak var outputDisplay: UILabel!
    @IBOutlet weak var inputDisplay: UITextField!
  
    @IBAction func numbers(_ sender: UIButton) {
        inputValueString = inputValueString + sender.currentTitle!
        inputDisplay.text = inputValueString
        
        switch unitOn {
        case 0:
            inputDisplay.text = inputValueString + Converter.init().inputUnit[0]
            outputDisplay.text = Converter.init().outputUnit[0]
            if Converter.init().inputUnit[0] == from {
                calculate()
            }
            
        case 1:
            inputDisplay.text = inputValueString + Converter.init().inputUnit[1]
            outputDisplay.text = Converter.init().outputUnit[1]
            if Converter.init().inputUnit[1] == from {
                calculate()
            }
        
        case 2:
            inputDisplay.text = inputValueString + Converter.init().inputUnit[2]
            outputDisplay.text = Converter.init().outputUnit[2]
            if Converter.init().inputUnit[2] == from {
                calculate()
            }
        
        case 3:
            inputDisplay.text = inputValueString + Converter.init().inputUnit[3]
            outputDisplay.text = Converter.init().outputUnit[3]
            if Converter.init().inputUnit[3] == from {
                calculate()
            }
        
        default:
            break
        }
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputDisplay.text = "°F"
        self.outputDisplay.text = "°C"
        from = "°F"
        calculate()
        

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func converterTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        

        alert.addAction(UIAlertAction(title: Converter.init().labels[0], style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
                self.inputDisplay.text = self.inputValueString + Converter.init().inputUnit[0]
                self.from = "°F"
                self.calculate()
                self.unitOn = 0
                
        }))
        alert.addAction(UIAlertAction(title: Converter.init().labels[1], style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
                self.inputDisplay.text = self.inputValueString + Converter.init().inputUnit[1]
                self.from = "°C"
                self.calculate()
                self.unitOn = 1
                
        }))
        alert.addAction(UIAlertAction(title: Converter.init().labels[2], style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
                self.inputDisplay.text = self.inputValueString + Converter.init().inputUnit[2]
                self.from = "mi"
                self.calculate()
                self.unitOn = 2

        }))
        alert.addAction(UIAlertAction(title: Converter.init().labels[3], style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
                self.inputDisplay.text = self.inputValueString + Converter.init().inputUnit[3]
                self.from = "km"
                self.calculate()
                self.unitOn = 3
        }))
            self.present(alert, animated: true, completion: nil)
    }

    func calculate(){
        
        var input: Double {
            return Double(inputValueString) ?? 0.0
        }

        
        switch from {
        case "°F":
            outputValueString = fahrenheitToCelcius(farenheit: input)
            self.outputDisplay.text = outputValueString
        case "°C":
            outputValueString = celciusToFahrenheit(celcius: input)
            self.outputDisplay.text = outputValueString
        case "km":
            outputValueString = kilometeresToMiles(kilometers: input)
            self.outputDisplay.text = outputValueString
        case "mi":
            outputValueString = milesToKilometers(miles: input)
            self.outputDisplay.text = outputValueString
            
        default:
            break
        }
    }

    @IBAction func clear(_ sender: Any) {
        self.inputValueString.removeAll()
        self.outputValueString.removeAll()
        self.inputDisplay.text = inputValueString + Converter.init().inputUnit[unitOn]
        self.outputDisplay.text = outputValueString + Converter.init().outputUnit[unitOn]
    }
    
    @IBAction func decimal(_ sender: Any) {
        if inputValueString.contains(".") {
            return
        }
        
        if inputValueString.isEmpty {
            inputValueString += "0."
        } else {
            inputValueString += "."
        }
    }
    
    @IBAction func negPos(_ sender: Any) {
            if inputValueString.contains("-") {
                if let i = inputValueString.characters.index(of: "-") {
                    inputValueString.remove(at: i)
                }
            } else {
                inputValueString = "-" + inputValueString
            }
        }
    

    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



