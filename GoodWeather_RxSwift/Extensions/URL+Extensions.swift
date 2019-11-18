//
//  URL+Extensions.swift
//  GoodWeather_RxSwift
//
//  Created by DONGGUN LEE on 11/18/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

extension URL{
    static func urlForWeatherAPI(city: String) -> URL?{
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)&units=imperial")
    }
}
