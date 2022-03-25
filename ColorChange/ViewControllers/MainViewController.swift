//
//  MainViewController.swift
//  ColorChange
//
//  Created by Вячеслав Квашнин on 24.03.2022.
//

import UIKit

protocol ColorDelegate {
    func getColor(for colorBackground: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.colorBackground = view.backgroundColor
    }
}

extension MainViewController: ColorDelegate {
    func getColor(for colorBackground: UIColor) {
        view.backgroundColor = colorBackground
    }
}
