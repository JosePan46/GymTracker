//
//  ejercicioViewModel.swift
//  GymTracker
//
//  Created by Jose Pan on 25/9/22.
//

import Foundation
import SwiftUI

final class ejercicioViewModel: ObservableObject{
    
    @Published var ejercicios: [EjercicioModel] = []
    
    init(){
        ejercicios = getAll()
        if ejercicios.isEmpty{
            ejercicioInit()
        }
    }
    
    func ejercicioInit () {
        var ejercicios: [EjercicioModel] = getAll()
        var serie: [SeriesModel] = []
        var contador : Int = 0;
        
        // Ejercicios de pecho
        
        if ejercicios.isEmpty {
            
            
            
            var pressBanca      : EjercicioModel = EjercicioModel(nombre: "Press Banca", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(pressBanca, at: contador)
            contador += 1
            var pressInclinado  : EjercicioModel = EjercicioModel(nombre: "Press Inclinado", series: serie, pesoMax: "0",pesoUlt: "0" ,ayuda:  false  )
            ejercicios.insert(pressInclinado, at: contador)
            contador += 1
            var fondos          : EjercicioModel = EjercicioModel(nombre: "Fondos", series: serie, pesoMax: "0",pesoUlt: "0" ,ayuda:  true )
            ejercicios.insert(fondos, at: contador)
            contador += 1
            var peck            : EjercicioModel = EjercicioModel(nombre: "Peck Deck", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(peck, at: contador)
            contador += 1
            
            //Ejercicios de triceps
            
            var tricepsFondos   : EjercicioModel = EjercicioModel(nombre: "Tríceps Fondos", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(tricepsFondos, at: contador)
            contador += 1
            var tricepsTirar    : EjercicioModel = EjercicioModel(nombre: "Tríceps Tirar", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(tricepsTirar, at: contador)
            contador += 1
            var tricepsPolea    : EjercicioModel = EjercicioModel(nombre: "Tríceps Polea", series: serie, pesoMax: "0",pesoUlt: "0" ,ayuda:  false)
            ejercicios.insert(tricepsPolea, at: contador)
            contador += 1
            
            //Ejercicios de espalda
            
            var dominadas       : EjercicioModel = EjercicioModel(nombre: "Dominadas", series: serie, pesoMax: "0",pesoUlt: "0" ,ayuda:  true)
            ejercicios.insert(dominadas, at: contador)
            contador += 1
            var facePoll        : EjercicioModel = EjercicioModel(nombre: "Face Poll", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(facePoll, at: contador)
            contador += 1
            var jalonAlPecho    : EjercicioModel = EjercicioModel(nombre: "Jalón al Pecho", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(jalonAlPecho, at: contador)
            contador += 1
            var remo            : EjercicioModel = EjercicioModel(nombre: "Remo", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(remo, at: contador)
            contador += 1
            
            //Ejercicios bíceps
            
            var bicepsPolea     : EjercicioModel = EjercicioModel(nombre: "Bíceps Polea", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(bicepsPolea, at: contador)
            contador += 1
            var bicepsBarra     : EjercicioModel = EjercicioModel(nombre: "Bíceps barra", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(bicepsBarra, at: contador)
            contador += 1
            var bicepsScott     : EjercicioModel = EjercicioModel(nombre: "Bíceps Scott", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(bicepsScott, at: contador)
            contador += 1
            var bicepsMancuerna : EjercicioModel = EjercicioModel(nombre: "Bíceps Mancuerna", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(bicepsMancuerna, at: contador)
            contador += 1
            
            //Ejercicio hombros
            
            var pressMilitar    : EjercicioModel = EjercicioModel(nombre: "Press Militar", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(pressMilitar, at: contador)
            contador += 1
            var elevacion       : EjercicioModel = EjercicioModel(nombre: "Elevación Lateral Hombros", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(elevacion, at: contador)
            contador += 1
            var levantamiento   : EjercicioModel = EjercicioModel(nombre: "Levantamiento de Hombros", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(levantamiento, at: contador)
            contador += 1
            //Ejercicios piernas
            
            var prensa          : EjercicioModel = EjercicioModel(nombre: "Prensa", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(prensa, at: contador)
            contador += 1
            var gemelos         : EjercicioModel = EjercicioModel(nombre: "Gemelos", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(gemelos, at: contador)
            contador += 1
            var isquios         : EjercicioModel = EjercicioModel(nombre: "Isquiotibiales", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(isquios, at: contador)
            contador += 1
            var cuadriceps      : EjercicioModel = EjercicioModel(nombre: "Cuádriceps", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(cuadriceps, at: contador)
            contador += 1
            var sentadillas     : EjercicioModel = EjercicioModel(nombre: "Sentadillas", series: serie, pesoMax: "0",pesoUlt: "0",ayuda:  false )
            ejercicios.insert(sentadillas, at: contador)
            contador += 1
            
            encodeAndSaveAll(ejercicios: ejercicios)
            
        }
    }
    
    func modificar2 (ejercicio: Binding<EjercicioModel>, pesoUlti: String){
        ejercicio.wrappedValue.pesoUlt = pesoUlti;
        
        let pesoU  = (pesoUlti as NSString).doubleValue
        let pesoM  = (ejercicio.wrappedValue.pesoMax as NSString).doubleValue
        
        if ejercicio.wrappedValue.ayuda {
            if pesoU < pesoM {
                ejercicio.wrappedValue.pesoMax = pesoUlti
            }
        }else{
            if pesoU > pesoM {
                ejercicio.wrappedValue.pesoMax = pesoUlti
            }
        }
    }
    
    
    private func encodeAndSaveAll(ejercicios:[EjercicioModel]){
        if let encoded = try? JSONEncoder().encode(ejercicios){
            UserDefaults.standard.set(encoded, forKey: "Ejercicios")
        }
    }
    
    func getAll() -> [EjercicioModel]{
        if let entrenoData = UserDefaults.standard.object(forKey: "Ejercicios") as? Data{
            if let ejercicio = try? JSONDecoder().decode([EjercicioModel].self, from: entrenoData){
                return ejercicio
            }
        }
        return []
    }
    
    func getPesoUltim (id:String) -> (String){
        var ult:String = ""
        if ejercicios.contains(where: {$0.id == id}){
            ult = ejercicios.first(where: {$0.id == id})!.pesoUlt
        }
        return ult
    }
    
    func getPesoMax (id:String) -> (String){
        var max:String = ""
        if ejercicios.contains(where: {$0.id == id}){
            max = ejercicios.first(where: {$0.id == id})!.pesoMax
        }
        return max
    }
    
    func getNombre (id:String) -> (String){
        var nombre:String = ""
        if ejercicios.contains(where: {$0.id == id}){
            nombre = ejercicios.first(where: {$0.id == id})!.nombre
        }
        return nombre
    }
    
    
    func getEjercicio (id:String) -> (EjercicioModel){
        var ejer : EjercicioModel = ejercicios.first(where: {$0.id == id})!
        return ejer
    }
    
    func modificar (ejercicioId: String, pesoUlti: String){
        if (ejercicios.contains(where: {$0.id == ejercicioId})){
            var ejercicio = ejercicios.first(where: {$0.id == ejercicioId})
            let pesoU  = (pesoUlti as NSString).doubleValue
            let pesoM  = (ejercicio!.pesoMax as NSString).doubleValue
            if pesoU > pesoM {
                ejercicio!.pesoMax = pesoUlti
            }
            ejercicio!.pesoUlt = pesoUlti
            if let i = ejercicios.firstIndex(of: ejercicio!){
                ejercicios[i] = ejercicio!
            }
        }
        encodeAndSaveAll(ejercicios: ejercicios)
    }
    
    func getAyuda (id: String) -> Bool{
        return ejercicios.first(where: {$0.id == id})!.ayuda
    }
    
    
    
    
}
