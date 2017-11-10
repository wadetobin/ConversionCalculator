//
//  ConverterViewController.swift
//  ConversionCalculator
//
//  Created by Wade Tobin on 11/9/17.
//  Copyright © 2017 Wade Tobin. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        outputDisplay.text = Converter.init().outputUnit[0]
        inputDisplay.text = Converter.init().inputUnit[0]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converterTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: Converter.init().labels[0], style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            
            self.outputDisplay.text = Converter.init().outputUnit[0]
            self.inputDisplay.text = Converter.init().inputUnit[0]
            
        }))
        alert.addAction(UIAlertAction(title: Converter.init().labels[1], style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            
            self.outputDisplay.text = Converter.init().outputUnit[1]
            self.inputDisplay.text = Converter.init().inputUnit[1]
            
        }))
        alert.addAction(UIAlertAction(title: Converter.init().labels[2], style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            
            self.outputDisplay.text = Converter.init().outputUnit[2]
            self.inputDisplay.text = Converter.init().inputUnit[2]
        }))
        alert.addAction(UIAlertAction(title: Converter.init().labels[3], style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            
            self.outputDisplay.text = Converter.init().outputUnit[3]
            self.inputDisplay.text = Converter.init().inputUnit[3]
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    struct Converter {
        let labels = ["Fahrenheit to Celcius", "Celcius to Fahrenheit", "Miles to Kilometers", "Kilometers to Miles"]
        let inputUnit = ["°F", "°C", "mi", "km"]
        let outputUnit = ["°C", "°F", "km", "mi"]
        
    }
    
    
    
//    func farenheitToCelcius(farenheit: Double) -> String {
//        let celcius = ((farenheit + fraction) - 32.0) * (5.0/9.0)
//        return String(celcius)
//    }
//
//    func kilometeresToMiles(speedInKPH: Double) -> String{
//        let speedInMPH = (speedInKPH + fraction) / 1.60934
//        return String(speedInMPH)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
