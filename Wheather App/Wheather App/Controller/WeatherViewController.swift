//MARK: - <#section#>
//  ViewController.swift
//  Wheather App
//
//  Created by Melisa Şimşek on 9.05.2025.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
   
    @IBOutlet weak var searchFieldText: UITextField!
    
    @IBOutlet weak var conditionImage: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
       
       
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        searchFieldText.delegate = self
    }

    
    @IBAction func locationButton(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}
//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
   
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
//MARK: - WeatherManagerDelegate
extension WeatherViewController :WeatherManagerDelegate {
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didUpdateWeather(_ weatherManager:WeatherManager , weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImage.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    }
//MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
   weatherManager.fetchWeather(latitude: latitude, longitude: longitude)
        

        }
        
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
