//
//  EntrenamientoModel.swift
//  GymApp
//
//  Created by Jose Pan on 13/9/22.
//

import Foundation

struct EntrenamientoModel: Codable{
    let id: String
    let titulo:String
    var ejercicios: [EjercicioModel]
    let fecha:String
    
    init (id:String = UUID().uuidString ,titulo:String, ejercicios: [EjercicioModel]){
        self.titulo     = titulo;
        self.ejercicios = ejercicios
        self.id = id
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.setLocalizedDateFormatFromTemplate("ddMMyy")
        fecha = dateFormatter.string(from: date)
    }
}
