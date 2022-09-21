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
    let id:String
    
    init(id:String = UUID().uuidString,repeticiones:String, peso:String){
        
        self.repeticiones = repeticiones;
        self.peso         = peso;
        self.id           = id;
        
    }
}
