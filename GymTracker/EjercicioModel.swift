//
//  EjercicioModel.swift
//  GymApp
//
//  Created by Jose Pan on 13/9/22.
//

import Foundation
import SwiftUI

struct EjercicioModel: Codable, Equatable{
    static func == (lhs: EjercicioModel, rhs: EjercicioModel) -> Bool {
        return lhs.id == rhs.id
        
    }
    
    let nombre:String
    var series: [SeriesModel]
    var pesoMax: String
    var pesoUlt: String
    let id:      String
    let ayuda:   Bool
    
    init (id:String = UUID().uuidString,nombre:String, series: [SeriesModel], pesoMax: String, pesoUlt: String, ayuda: Bool){
        self.nombre     = nombre
        self.series     = series
        self.pesoMax    = pesoMax
        self.pesoUlt    = pesoUlt
        self.id         = id
        self.ayuda      = ayuda
    }
    
}

