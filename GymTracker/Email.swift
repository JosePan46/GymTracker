//
//  Email.swift
//  GymTracker
//
//  Created by Jose Pan on 20/9/22.
//

import Foundation
import SwiftUI

struct Email {
    let direccion: String
    let subject: String
    let header: String
    let ejercicios: [EjercicioModel]
    
    let body: String
    
    func send (openUrl: OpenURLAction){
        let urlString = "mailto:\(direccion)?subject=\(subject.addingPercentEncoding(withAllowedCharacters:  .urlPathAllowed) ?? "")&body=\(body.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")"
        
        guard let url = URL(string: urlString) else { return }
        openUrl(url) { accepted in
            if !accepted {
                print("""
                Not support
                \(body)
                """)
            }
            
        }
    }
    
    func cuerpoEmail (ejercicios : [EjercicioModel]) -> String{
        
        var c : String = ""
        
        var count: Int = 1;
        
        for ejercicio in ejercicios {
            c += ejercicio.nombre + "\n"
            count = 1
            for serie in ejercicio.series {
                
                c += "\n" + "Serie " + "\(count): " + "\t  Repeticiones: "
                c += serie.repeticiones + "\t" + "\t" + " Peso: " + serie.peso + " Kg"
                c += "\n"
                count += 1
                
            }
            c += "\n" + "\n"
        }
        c += "\n" + "\n" + "\n" + "\n" + "Email autogenerado por GymTracker"
        return c;
    }
    
}
