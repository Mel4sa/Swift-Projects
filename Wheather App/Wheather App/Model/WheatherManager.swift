//
//  WheatherManager.swift
//  Wheather App
//
//  Created by Melisa Şimşek on 13.05.2025.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=717ea1025fa138ede7394ae5a9b846cc&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
     print(urlString)
        
    }
}

