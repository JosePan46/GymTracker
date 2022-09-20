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
    
    @State private var isPresented  : Bool = false
    @State private var confirmation : Bool = false
    @State private var emailControl : Bool = false
    
    @EnvironmentObject var appState: AppState
    
    
    @Environment(\.openURL) var openUrl
    @State private var direccionEmail : String = ""
    @State private var subjectEmail : String = ""
    @State private var headerEmail : String = "header"
    @State private var cuerpo : String = ""
    
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
                    
                    .multilineTextAlignment(.trailing)
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
                
                Section{
                    HStack{
                        TextField("Dirección email", text: $direccionEmail)
                        Button("Enviar"){
                            if (direccionEmail == ""){
                                emailControl = true;
                            }
                            subjectEmail = titulo;
                            cuerpo = cuerpoEmail(ejercicios: ejercicios)
                            let email = Email(direccion: direccionEmail, subject: subjectEmail, header: "header", ejercicios: ejercicios, body: cuerpo)
                            email.send(openUrl: openUrl)
                        }
                        .alert(isPresented: $emailControl, content: {
                            Alert(title: Text("Atención"),
                                  message: Text("La dirección de correo no puede estar vacío"))
                        })
                    }
                }
            }
            
            Spacer()
            Button(action: {
                if titulo=="" {
                    isPresented = true
                }else{
                    confirmation = true;
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
            .alert(isPresented: $confirmation, content: {
                Alert(title: Text("Confirmar"),
                      message:  Text("¿Está seguro de que desea finalizar el entrenamiento"),
                      primaryButton: Alert.Button.default(Text("Aceptar"), action: {
                    entrenoViewModel.saveEntrenamiento(titulo: titulo, ejercicios: ejercicios)
                    titulo=""
                    appState.boar = true
                    
                    print("El user ha pulsado el botón de Aceptar")
                }),
                      secondaryButton: .destructive(Text("Cancelar")))
            })
        }
    }
}

struct aniadirEntreno_Previews: PreviewProvider {
    static var previews: some View {
        aniadirEntreno()
    }
}

func cuerpoEmail (ejercicios : [EjercicioModel]) -> String{
    
    var c : String = ""
    
    var count: Int = 1;
    
    for ejercicio in ejercicios {
        c += ejercicio.nombre + "\n"
        count = 1
        for serie in ejercicio.series {
            
            c += "\n" + "Serie: " + "\(count)" + "\n"
            c += serie.repeticiones + "/t" + serie.peso
            c += "\n"
            count += 1
            
        }
    }
    return c;
}
