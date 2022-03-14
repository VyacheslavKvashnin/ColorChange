//
//  ViewController.swift
//  ColorChange
//
//  Created by Вячеслав Квашнин on 13.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewColorChange: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColorChange.layer.cornerRadius = 15
        
        redLabel.text = "0.00"
        greenLabel.text = "0.00"
        blueLabel.text = "0.00"
       
    }
    
    @IBAction func getRgbColor() {
        redLabel.text = String(format: "%.2f", redColorSlider.value)
        greenLabel.text = String(format: "%.2f", greenColorSlider.value)
        blueLabel.text = String(format: "%.2f", blueColorSlider.value)

        let redValue = CGFloat(redColorSlider.value)
        let greenValue = CGFloat(greenColorSlider.value)
        let blueValue = CGFloat(blueColorSlider.value)

        viewColorChange.backgroundColor = UIColor(
            red: CGFloat(redValue),
            green: CGFloat(greenValue),
            blue: CGFloat(blueValue),
            alpha: 1)
    }
}

