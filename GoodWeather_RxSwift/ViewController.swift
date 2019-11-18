//
//  ViewController.swift
//  GoodWeather_RxSwift
//
//  Created by DONGGUN LEE on 11/17/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.cityNameTextField.rx.controlEvent(.editingDidEndOnExit).asObservable().map{ self.cityNameTextField.text }
            .subscribe(onNext:{ city in
                if let city = city{
                    if city.isEmpty{
                        self.displayWeather(nil)
                    }
                    else{
                        self.fetchWeather(by: city)
                    }
                }
            }).disposed(by: disposeBag)
        
//        self.cityNameTextField.rx.value.subscribe(onNext:{ city in
//            
//            if let city = city{
//                if city.isEmpty {
//                    self.displayWeather(nil)
//                }else{
//                    self.fetchWeather(by: city)
//                }
//            }
//            
//            }).disposed(by: disposeBag)
        
    }

    private func displayWeather(_ weather: Weather?){
        if let weather = weather{
            self.temperatureLabel.text = "\(weather.temp) ℉"
            self.humidityLabel.text = "\(weather.humidity) 💦"
        }else{
            self.temperatureLabel.text = "🐵"
            self.humidityLabel.text = "❌"
        }
    }
    
    private func fetchWeather(by city: String){
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed), let url = URL.urlForWeatherAPI(city: cityEncoded) else{
            return
        }
        
        let resource = Resource<WeatherResult>(url: url)
        
        URLRequest.load(resource: resource)
            .observeOn(MainScheduler.instance)
            .catchErrorJustReturn(WeatherResult.empty)
            .subscribe(onNext:{ result in
            
            let weather = result.main
            self.displayWeather(weather)
            
            }).disposed(by: disposeBag)
    }
}

