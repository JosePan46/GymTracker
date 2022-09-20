//
//  EjercicioModel.swift
//  GymApp
//
//  Created by Jose Pan on 13/9/22.
//

import Foundation

struct EjercicioModel: Codable{
    let nombre:String
    var series: [SeriesModel]
    
    init (nombre:String, series: [SeriesModel]){
        self.nombre = nombre
        self.series = series
    }
    
}
