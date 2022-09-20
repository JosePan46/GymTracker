//
//  SeriesModel.swift
//  GymApp
//
//  Created by Jose Pan on 13/9/22.
//

import Foundation

struct SeriesModel: Codable{
    let repeticiones:String
    let peso:String
    
    init(repeticiones:String, peso:String){
        
        self.repeticiones = repeticiones;
        self.peso         = peso;
        
    }
}
