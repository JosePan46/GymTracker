//
//  ContentView.swift
//  GymApp
//
//  Created by Jose Pan on 13/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var entrenoViewModel = EntrenamientoViewModel()
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack {
                    Button(action: {
                        appState.boar = false;
                    }){
                        Image(systemName: "plus.circle")
                        Text("Empezar entrenamiento")
                    }
                }
                List{
                    //Text("Entrenamientos anteriores")
                    ForEach(entrenoViewModel.entrenamientos, id: \.id){ entrenamiento in
                        NavigationLink(destination: detalle(titulo: entrenamiento.titulo, ejercicios: entrenamiento.ejercicios, fecha: entrenamiento.fecha)){
                            HStack {
                                Text(entrenamiento.titulo)
                                Spacer()
                                Text(entrenamiento.fecha)
                            }
                        }
                        .swipeActions(edge: .leading ){
                            Button{
                                entrenoViewModel.removeEntreno(with: entrenamiento.id)
                            } label:{
                                Label("Delete", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .principal){
                        HStack{
                            Text("Gym Tracker").font(.title).fontWeight(.bold)
                            Image(systemName: "magazine")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
