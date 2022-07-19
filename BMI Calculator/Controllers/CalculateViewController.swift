//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var bmiValue = "0.0"
    
    //Height Text
    @IBOutlet weak var height: UILabel!
    //Height Slider
    @IBOutlet weak var heightSlider: UISlider!
    
    //Weight Text
    @IBOutlet weak var weight: UILabel!
    //Weight Slider
    @IBOutlet weak var weightSlider: UISlider!
     
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightUpdate(_ sender: UISlider) {
        height.text = String(format: "%.2f", sender.value) + " m"
    }
    
    @IBAction func weightUpdate(_ sender: UISlider) {
        weight.text = String(format: "%.0f", sender.value) + " Kg"
    }
    
    @IBAction func CalculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        //BMI  Weight (Kg) / Height (m)²
        let bmi = weight / pow(height, 2)
        bmiValue = String(format: "%.1f", bmi)
        
        //Função que vai chamar a outra view.
        //"goToResult" é o nome do link entre as telas.
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    // Função que vai alterar a classe da view antes de chama-la
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult"){
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = self.bmiValue
        }
    }
}


