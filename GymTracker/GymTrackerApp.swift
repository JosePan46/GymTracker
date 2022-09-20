//
//  GymTrackerApp.swift
//  GymTracker
//
//  Created by Jose Pan on 16/9/22.
//

import SwiftUI


class AppState: ObservableObject {
    @Published var boar : Bool
    
    init (boar: Bool){
        self.boar = boar
    }
}

@main
struct GymTrackerApp: App {
    
    @ObservedObject var appState = AppState(boar: true)
    var body: some Scene {
        WindowGroup {
            if appState.boar{
                ContentView()
                    .environmentObject(appState)
            }else{
                aniadirEntreno()
                    .environmentObject(appState)
            }
        
        }
    }
}
