//
//  EntrenamientoViewModel.swift
//  GymApp
//
//  Created by Jose Pan on 13/9/22.
//

import Foundation
import SwiftUI

final class EntrenamientoViewModel: ObservableObject{
    
    @Published var entrenamientos: [EntrenamientoModel] = []
    
    init(){
        entrenamientos = getAll()
    }
    
    func saveEntrenamiento (titulo: String, ejercicios: [EjercicioModel]){
        let newEntrenamiento = EntrenamientoModel(titulo: titulo, ejercicios: ejercicios)
        entrenamientos.insert(newEntrenamiento, at: 0)
        encodeAndSaveAll()
        
        
    }
    
    private func encodeAndSaveAll(){
        if let encoded = try? JSONEncoder().encode(entrenamientos){
            UserDefaults.standard.set(encoded, forKey: "Entrenos")
        }
    }
    
    func getAll() -> [EntrenamientoModel]{
        if let entrenoData = UserDefaults.standard.object(forKey: "Entrenos") as? Data{
            if let entreno = try? JSONDecoder().decode([EntrenamientoModel].self, from: entrenoData){
                return entreno
            }
        }
        return []
    }
    
    func removeEntreno (with id: String){
        entrenamientos.removeAll(where: {$0.id == id})
        encodeAndSaveAll()
    }
    
    func updateEntreno (entrenos: Binding<EntrenamientoModel>){
        //entrenos.wrappedValue.
    }
    
    
}
