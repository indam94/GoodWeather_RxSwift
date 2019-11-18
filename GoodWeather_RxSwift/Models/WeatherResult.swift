//
//  WeatherResult.swift
//  GoodWeather_RxSwift
//
//  Created by DONGGUN LEE on 11/17/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

struct WeatherResult: Decodable{
    let main: Weather
}

struct Weather: Decodable{
    let temp: Double
    let humidity: Double
}
