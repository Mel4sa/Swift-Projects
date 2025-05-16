//
//  WheatherData.swift
//  Wheather App
//
//  Created by Melisa Şimşek on 15.05.2025.
//

struct WeatherData: Codable {
    let name: String
    let main:Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    
}
struct Weather: Codable {
    
    let description: String
    let id: Int
    
}
