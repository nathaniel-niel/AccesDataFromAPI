//
//  APIServices.swift
//  learnGetDataFromAPI
//
//  Created by Nathaniel Andrian on 27/12/21.
//

import Foundation

struct APIService{
    
    func fetchData(completion: @escaping(([Animal])->Void)){
        // create a url
        if let  url = URL(string: Constant.shared.url){
            // create a session
            let session = URLSession(configuration: .default)
            
            // give the session a task
            let task = session.dataTask(with: url) { data, resp, error in
                if error != nil{
                    print(error!)
                }
                if let safe_data = data{
                    let decoder = JSONDecoder()
                    do{
                        let result = try decoder.decode([RandomAnimals].self, from: safe_data)
                        var animal = [Animal]()
                        for data in result{
                            animal.append(Animal(name: data.name, latin_name: data.latin_name, animal_type: data.animal_type, active_time: data.active_time, lifespan: data.lifespan))
                        }
                        completion(animal)
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
            }
            task.resume()
        }
    }
}
