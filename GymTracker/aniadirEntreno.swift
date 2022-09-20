//
//  aniadirEntrenoView.swift
//  GymApp
//
//  Created by Jose Pan on 13/9/22.
//

import SwiftUI
import MessageUI

let ejerciciosArray = ["Press de banca", "Biceps polea"]

struct aniadirEntreno: View {
    @StateObject var entrenoViewModel = EntrenamientoViewModel()
    @State private var titulo : String = ""
    @State private var ejercicios : [EjercicioModel] = []
    
    @State private var nombreEjercicio : String = ""
    @State private var numRepeticiones1 : String = ""
    @State private var numRepeticiones2 : String = ""
    @State private var numRepeticiones3 : String = ""
    @State private var numRepeticiones4 : String = ""
    
    @State private var pesos1 : String = ""
    @State private var pesos2 : String = ""
    @State private var pesos3 : String = ""
    @State private var pesos4 : String = ""
    
    @State private var isPresented : Bool = false
    
    @EnvironmentObject var appState: AppState
    
    
    var body: some View {
        VStack(){
            Section{
                HStack{
                    Button(action:{
                        appState.boar = true
                    }) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                        Spacer()
                    }
                           
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    //.padding(.trailing, 330)
                }
                HStack{
                    
                    Text("Gym Tracker").font(.title).fontWeight(.bold)
                    Image(systemName: "magazine")
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            Form{
                Section{
                    TextField("Título del día", text: $titulo)
                    
                }
                TextField("Nombre del ejercicio", text: $nombreEjercicio)
                HStack {
                    Text("Serie 1")
                    Spacer()
                    TextField("Nº Repeticiones", text: $numRepeticiones1)
                    TextField("Peso", text: $pesos1)
                }
                HStack {
                    Text("Serie 2")
                    Spacer()
                    TextField("Nº Repeticiones", text: $numRepeticiones2)
                    TextField("Peso", text: $pesos2)
                }
                HStack {
                    Text("Serie 3")
                    Spacer()
                    TextField("Nº Repeticiones", text: $numRepeticiones3)
                    TextField("Peso", text: $pesos3)
                }
                HStack {
                    Text("Serie 4")
                    Spacer()
                    TextField("Nº Repeticiones", text: $numRepeticiones4)
                    TextField("Peso", text: $pesos4)
                }
                Button(action: {
                    print("Añadiendo")
                    let serie1 = SeriesModel(repeticiones: numRepeticiones1, peso: pesos1)
                    let serie2 = SeriesModel(repeticiones: numRepeticiones2, peso: pesos2)
                    let serie3 = SeriesModel(repeticiones: numRepeticiones3, peso: pesos3)
                    let serie4 = SeriesModel(repeticiones: numRepeticiones4, peso: pesos4)
                    let seriesArray = [serie1,serie2,serie3,serie4]
                    
                    
                    let ejercicio = EjercicioModel(nombre: nombreEjercicio, series: seriesArray)
                    
                    ejercicios.insert(ejercicio, at: ejercicios.count)
                    
                    nombreEjercicio=""
                    numRepeticiones1=""
                    numRepeticiones2=""
                    numRepeticiones3=""
                    numRepeticiones4=""
                    
                    pesos1=""
                    pesos2=""
                    pesos3=""
                    pesos4=""
                    
                }) {
                    HStack(alignment: .center){
                        Text("Añadir ejercicio")
                            .multilineTextAlignment(.center)
                        Spacer()
                        Image(systemName: "plus.app")
                    }
                }
            }
            Spacer()
            Button(action: {
                if titulo=="" {
                    isPresented = true
                }else{
                    entrenoViewModel.saveEntrenamiento(titulo: titulo, ejercicios: ejercicios)
                    titulo=""
                    appState.boar = true
                }
            }) {
                Text("Finalizar entrenamiento")
                                   .fontWeight(.heavy)
                                   .foregroundColor(Color.red)
            }
                   
            .alert(isPresented: $isPresented, content: {
                Alert(title: Text("Atención"),
                      message: Text("El título del día no puede estar vacío"))
            })
        }
    }
}

struct aniadirEntreno_Previews: PreviewProvider {
    static var previews: some View {
        aniadirEntreno()
    }
}
