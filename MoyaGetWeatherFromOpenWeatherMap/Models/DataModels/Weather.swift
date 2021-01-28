//
//  Weather.swift
//  MoyaGetWeatherFromOpenWeatherMap
//
//  Created by Artem Bazhanov on 28.01.2021.
//

import Foundation
import ObjectMapper

extension Weather: Mappable{
    func mapping(map: Map) {
        id <- map["id"]
        nameCity <- map["name"]
       

    }
}

class Weather: NSObject {

    var id: Int?
    var nameCity: String?
  
    required init?(map: Map) { super.init() }

}
