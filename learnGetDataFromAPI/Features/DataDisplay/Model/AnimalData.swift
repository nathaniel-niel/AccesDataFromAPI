//
//  DisplayDataModel.swift
//  learnGetDataFromAPI
//
//  Created by Nathaniel Andrian on 27/12/21.
//

import Foundation

struct RandomAnimals: Codable{
    let name: String
    let latin_name: String
    let animal_type: String
    let active_time: String
    let lifespan: String
}
/*
name": "Western Gaboon Viper",
    "latin_name": "Bitis rhinoceros",
    "animal_type": "Reptile",
    "active_time": "Nocturnal",
    "length_min": "4",
    "length_max": "6",
    "weight_min": "40",
    "weight_max": "45",
    "lifespan": "20",
    "habitat": "Tropical forest",
    "diet": "Rodents and other small mammals",
    "geo_range": "Central Africa",
    "image_link": "https://upload.wikimedia.org/wikipedia/commons/9/98/Bitis_gabonica.jpg",
    "id": 184
*/

