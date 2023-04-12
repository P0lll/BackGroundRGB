//
//  StartViewController.swift
//  HW 2
//
//  Created by Admin on 11/04/2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func cnahgeColor(for changeColor: SettingColor)
}

final class StartViewController: UIViewController {
    
    var red: Float!
    var green: Float!
    var blue: Float!
    
    private var settingColor = SettingColor(red: 0.0, green: 0.0, blue: 0.0) {
        didSet {
            red = Float(settingColor.red)
            green = Float(settingColor.green)
            blue = Float(settingColor.blue)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let settingVC = segue.source as? SettingColorViewController else { return }
        view.backgroundColor = UIColor(
            red: CGFloat(settingVC.redSlider.value),
            green: CGFloat(settingVC.greenSlider.value),
            blue: CGFloat(settingVC.blueSlider.value),
            alpha: 1
        )
        
    }
    
}
extension StartViewController: SettingsViewControllerDelegate {
    func cnahgeColor(for changeColor: SettingColor) {
        self.settingColor = changeColor
    }
}

