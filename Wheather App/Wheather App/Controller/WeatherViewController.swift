//
//  ViewController.swift
//  Wheather App
//
//  Created by Melisa Şimşek on 9.05.2025.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var searchFieldText: UITextField!
    
    @IBOutlet weak var conditionImage: UIImageView!
    
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    var weatherManager = WeatherManager()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFieldText.delegate = self
    }
    
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchFieldText.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField)-> Bool {
        searchFieldText.endEditing(true)
        return true
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
            
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchFieldText.text {
            weatherManager.fetchWeather(cityName: city)
            
        }
        searchFieldText.text = ""
    }
}
