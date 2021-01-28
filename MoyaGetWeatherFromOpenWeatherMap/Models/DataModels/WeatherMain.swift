//
//  WeatherMain.swift
//  MoyaGetWeatherFromOpenWeatherMap
//
//  Created by Artem Bazhanov on 28.01.2021.
//

import Foundation
import ObjectMapper

extension WeatherMain: Mappable{
    func mapping(map: Map) {
        temp <- map["temp"]
    }
}

class WeatherMain: NSObject {
    
    var temp: Double?
  
    required init?(map: Map) { super.init() }

}
