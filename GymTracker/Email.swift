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
    
    
    
}
