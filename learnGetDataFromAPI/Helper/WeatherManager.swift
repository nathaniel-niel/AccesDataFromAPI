//
//  WeatherManager.swift
//  Clima
//
//  Created by Nathaniel Andrian on 27/12/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation
protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=6781bf7fee8160b073a05fb55ada870e&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather (cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName )"
        performRequest(url: urlString)
    }
   
    func fetchWetherWithCurrentLocation(lat: CLLocationDegrees, lon: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(url: urlString)
    }
    
    func performRequest(url: String){
        // create a  url
        if let url = URL(string: url){
            // create a url session
            let session =  URLSession(configuration: .default)
            
            // give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = parseJSON(weatherData: safeData){
                        delegate?.didUpdateWeather(self, weather: weather)
                        
                    }
                }
            }
            
            // start the task
            task.resume()
        }
    }
    
    func parseJSON (weatherData: Data ) -> WeatherModel?  {
        let decoder = JSONDecoder()
        do{
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData )
            
            let cityName = decodeData.name
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            
            let weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temp)
            return weather
      
            
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}
