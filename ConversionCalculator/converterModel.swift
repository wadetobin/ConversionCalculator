//
//  converter.swift
//  ConversionCalculator
//
//  Created by Wade Tobin on 12/9/17.
//  Copyright © 2017 Wade Tobin. All rights reserved.
//

import Foundation

struct Converter {
    var labels = ["Fahrenheit to Celcius", "Celcius to Fahrenheit", "Miles to Kilometers", "Kilometers to Miles"]
    var inputUnit = ["°F", "°C", "mi", "km"]
    var outputUnit = ["°C", "°F", "km", "mi"]
}


func kilometeresToMiles(kilometers: Double) -> String{
    let miles = (kilometers) / 1.60934
    return String(format: "%.2f", miles) + Converter.init().outputUnit[3]
}

func fahrenheitToCelcius(farenheit: Double) -> String {
    let celcius = ((farenheit) - 32) * (5/9)
    return String(format: "%.2f", celcius) + Converter.init().outputUnit[0]
}

func celciusToFahrenheit(celcius: Double) -> String {
    let fahrenheit = (celcius * (9/5)) + 32
    return String(format: "%.2f", fahrenheit) + Converter.init().outputUnit[1]
}

func milesToKilometers(miles: Double) -> String{
    let kilometers = miles * 1.60934
    return String(format: "%.2f", kilometers) + Converter.init().outputUnit[2]
}
