//
//  ViewController.swift
//  ColorChange
//
//  Created by Вячеслав Квашнин on 13.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var viewColorChange: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    @IBOutlet weak var redColorTextField: UITextField!
    @IBOutlet weak var greenColorTextField: UITextField!
    @IBOutlet weak var blueColorTextField: UITextField!
    
    // MARK: - Public Properties
    var delegate: ColorDelegate!
    var colorBackground: UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColorChange.layer.cornerRadius = 15
        
        redColorTextField.delegate = self
        greenColorTextField.delegate = self
        blueColorTextField.delegate = self
        
        viewColorChange.backgroundColor = colorBackground
        
        setSliders()
        setValueToLabel()
        setValueToTextField()
    }
    
    // MARK: - IBActions
    @IBAction func getRgbColor() {
        
        setValueToLabel()
        setValueToTextField()
        
        colorBackground = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1)
        
        viewColorChange.backgroundColor = colorBackground
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.getColor(for: viewColorChange.backgroundColor ?? UIColor.white)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setSliders() {
        let ciColor = CIColor(color: colorBackground)
        
        redColorSlider.value = Float(ciColor.red)
        greenColorSlider.value = Float(ciColor.green)
        blueColorSlider.value = Float(ciColor.blue)
    }
    
    private func setValueToLabel() {
        redLabel.text = String(format: "%.2f", redColorSlider.value)
        greenLabel.text = String(format: "%.2f", greenColorSlider.value)
        blueLabel.text = String(format: "%.2f", blueColorSlider.value)
    }
    
    private func setValueToTextField() {
        redColorTextField.text = redLabel.text
        greenColorTextField.text = greenLabel.text
        blueColorTextField.text = blueLabel.text
    }
}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redColorTextField:
                redColorSlider.value = currentValue
                redLabel.text = String(currentValue)
                getRgbColor()
            case greenColorSlider:
                greenColorSlider.value = currentValue
                greenLabel.text = String(currentValue)
                getRgbColor()
            default:
                blueColorSlider.value = currentValue
                blueLabel.text = String(currentValue)
                getRgbColor()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case redColorTextField: greenColorTextField.becomeFirstResponder()
        case greenColorTextField: blueColorTextField.becomeFirstResponder()
        default: redColorTextField.becomeFirstResponder()
        }
        return true
    }
}
