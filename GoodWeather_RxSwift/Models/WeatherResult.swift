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

extension WeatherResult{
    static var empty: WeatherResult{
        return WeatherResult(main: Weather(temp: 0.0, humidity: 0.0))
    }
}

struct Weather: Decodable{
    let temp: Double
    let humidity: Double
}
