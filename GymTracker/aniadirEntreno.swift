//
//  aniadirEntrenoView.swift
//  GymApp
//
//  Created by Jose Pan on 13/9/22.
//

import SwiftUI
import MessageUI

var ejercicioSeleccionado :String = ""

struct aniadirEntreno: View {
    
    
    @StateObject var entrenoViewModel       = EntrenamientoViewModel()
    @StateObject var eejercicioViewModel    = ejercicioViewModel()
    
    //Entrenamiento
    @State private var titulo : String = ""
    
    
    //Ejercicio
    @State private var seleccionado : String = ""
    @State private var ejercicios : [EjercicioModel] = []
    
    //Entorno
    @EnvironmentObject var appState: AppState
    
    //Email
    
    @State private var direccionEmail   : String = ""
    @State private var subjectEmail     : String = ""
    @State private var headerEmail      : String = "header"
    @State private var cuerpo           : String = ""
    @Environment(\.openURL) var openUrl
    @State private var emailControl     : Bool = false
    
    
    
    //Series y pesos
    @State private var nombreEjercicio :  String = ""
    @State private var numRepeticiones1 : String = ""
    @State private var numRepeticiones2 : String = ""
    @State private var numRepeticiones3 : String = ""
    @State private var numRepeticiones4 : String = ""
    
    @State private var pesos1 : String = ""
    @State private var pesos2 : String = ""
    @State private var pesos3 : String = ""
    @State private var pesos4 : String = ""
    
    @State private var pesoU  : String = ""
    
    
    //Control
    
    @State private var isPresented      : Bool = false
    @State private var confirmation     : Bool = false
    @State private var ejercicioControl : Bool = false
    
    var body: some View {
        VStack{
            Section{
                VStack(alignment: .trailing){
                    Section{
                        HStack{
                            Button(action:{
                                appState.boar = true
                            }) {
                                Image(systemName: "chevron.left")
                                Text("Back")
                                
                            }
                            Spacer()
                                .multilineTextAlignment(.trailing)
                        }
                    }
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
                    TextField("Título del entrenamiento", text: $titulo)
                }
                Picker("Ejercicios", selection: $seleccionado){
                    ForEach($eejercicioViewModel.ejercicios, id:\.id){ $ejercicio in
                        Text(ejercicio.nombre)
                    }
                }
                HStack{
                    Text("Peso máximo")
                    Spacer()
                    Text("\(eejercicioViewModel.getPesoMax(id: seleccionado))")
                    Text("Kg")
                }
                HStack{
                    Text("Último peso")
                    Spacer()
                    Text("\(eejercicioViewModel.getPesoUltim(id:seleccionado))")
                    Text("Kg")
                }
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
                    ejercicioControl = true;
                    
                    
                }) {
                    HStack(alignment: .center){
                        Text("Añadir ejercicio")
                            .multilineTextAlignment(.center)
                        Spacer()
                        Image(systemName: "plus.app")
                    }
                }
                .alert(isPresented: $ejercicioControl, content: {
                    Alert(title: Text("Confirmar"),
                          message:  Text("¿Está seguro de que desea añadir el ejercicio?"),
                          primaryButton: Alert.Button.default(Text("Aceptar"), action: {
                        
                        let serie1 = SeriesModel(repeticiones: numRepeticiones1, peso: pesos1)
                        let serie2 = SeriesModel(repeticiones: numRepeticiones2, peso: pesos2)
                        let serie3 = SeriesModel(repeticiones: numRepeticiones3, peso: pesos3)
                        let serie4 = SeriesModel(repeticiones: numRepeticiones4, peso: pesos4)
                        let seriesArray = [serie1,serie2,serie3,serie4]
                        
                        pesoU = mayor(peso1: pesos1, peso2: pesos2, peso3: pesos3, peso4: pesos4)
                        
                        let ejercicio = EjercicioModel(nombre: eejercicioViewModel.getNombre(id: seleccionado), series: seriesArray, pesoMax: "0", pesoUlt: "0", ayuda: false)
                        
                        ejercicios.insert(ejercicio, at: ejercicios.count)
                        
                        //@State var ejercicioPrueba = eejercicioViewModel.getEjercicio(id: seleccionado)
                        
                        eejercicioViewModel.modificar(ejercicioId: seleccionado, pesoUlti: pesoU)
                        
                        nombreEjercicio=""
                        numRepeticiones1=""
                        numRepeticiones2=""
                        numRepeticiones3=""
                        numRepeticiones4=""
                        
                        pesos1=""
                        pesos2=""
                        pesos3=""
                        pesos4=""
                        
                        
                        print("El user ha pulsado el botón de Aceptar")
                    }),
                          secondaryButton: .destructive(Text("Cancelar")))
                })
                Section{
                    HStack{
                        TextField("Dirección email", text: $direccionEmail)
                        Button("Enviar"){
                            if (direccionEmail == ""){
                                emailControl = true;
                            }else{
                                subjectEmail = titulo;
                                cuerpo = cuerpoEmail(ejercicios: ejercicios)
                                let email = Email(direccion: direccionEmail, subject: subjectEmail, header: "header", ejercicios: ejercicios, body: cuerpo)
                                email.send(openUrl: openUrl)
                                
                                //Prueba para ver si funciona (necesitamos el movil)
                                entrenoViewModel.saveEntrenamiento(titulo: titulo, ejercicios: ejercicios)
                                titulo=""
                                ejercicios = []
                                appState.boar = true
                            }
                        }
                        .alert(isPresented: $emailControl, content: {
                            Alert(title: Text("Atención"),
                                  message: Text("La dirección de correo no puede estar vacío"))
                        })
                    }
                    Section{
                        
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
                                  message:  Text("¿Está seguro de que desea finalizar el entrenamiento?"),
                                  primaryButton: Alert.Button.default(Text("Aceptar"), action: {
                                entrenoViewModel.saveEntrenamiento(titulo: titulo, ejercicios: ejercicios)
                                titulo=""
                                ejercicios = []
                                appState.boar = true
                                
                                print("El user ha pulsado el botón de Aceptar")
                            }),
                                  secondaryButton: .destructive(Text("Cancelar")))
                        })
                    }
                }
                
                
            }
            
        }
    }
}


struct aniadirEntreno_Previews: PreviewProvider {
    static var previews: some View {
        aniadirEntreno()
    }
}


func mayor (peso1:String, peso2:String, peso3:String, peso4:String) -> (String){
    var mayor:String = ""
    
    let pesouno     = (peso1 as NSString).doubleValue
    let pesodos     = (peso2 as NSString).doubleValue
    let pesotres    = (peso3 as NSString).doubleValue
    let pesocuatro  = (peso4 as NSString).doubleValue
    
    var ganador:Double = 0
    
    if pesouno > pesodos {
        ganador = pesouno
    }else{
        ganador = pesodos
    }
    
    if pesotres > pesocuatro{
        if (pesotres > ganador){
            ganador = pesotres
        }
    }else{
        if pesocuatro > ganador {
            ganador = pesocuatro
        }
    }
    
    mayor = String(format:"%.2f", ganador)
    
    return mayor;
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
