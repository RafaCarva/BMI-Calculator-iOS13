//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Rafael Carvalho on 20/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    
    var bmi: BMI? //? diz que essa var é opcional
 
    mutating func calculateBMI(height: Float, weight: Float) {
        //BMI  Weight (Kg) / Height (m)²
        let bmiValue = weight / pow(height, 2) //Isso é um FLoat
        
        if(bmiValue < 18.5){
            //Underweight
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.blue)
        } else if (bmiValue >= 18.5) && (bmiValue <= 24.9){
            //Normal
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        } else if(bmiValue > 24.9){
            //Overweight
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.purple)
        }
    }
    
    func getBMIValue() -> String{
        
        return String(format: "%.1f", bmi?.value ?? 0.0)
        /*
         Sobre o "bmi?.value ?? 0.0)": Como a var bmiValue é opcional,
         o código diz "se bmiValue.value for nil, use 0.0 no lugar".
         */
    }
    
    func getAdvice() -> String{
        bmi?.advice ?? "No Advice" //Se o valor for nil, use o "No Advice"
    }
    
    func getColor() -> UIColor{
        bmi?.color ?? UIColor.gray
    }
    
}

/*
 BMI Categories:
 Underweight < 18.5
 Normal weight = 18.5 24.9
 Overweight = > 24.9
 */

 
