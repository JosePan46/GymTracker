//
//  detalle.swift
//  GymApp
//
//  Created by Jose Pan on 14/9/22.
//

import SwiftUI

let serie1   = SeriesModel(repeticiones: "1",   peso:       "10")
let serie2   = SeriesModel(repeticiones: "8",   peso:       "5")
let series3  = SeriesModel(repeticiones: "10",  peso:       "15")
let series4  = SeriesModel(repeticiones: "5",   peso:       "20")


let series = [serie1, serie2,series3,series4]
let eje1   = EjercicioModel(nombre: "Press Banca", series: series, pesoMax: "0", pesoUlt: "0", ayuda: false)

let eje2   = EjercicioModel(nombre: "Biceps polea", series: series, pesoMax: "0", pesoUlt: "0", ayuda: false)

let eje3   = EjercicioModel(nombre: "Press inclinado", series: series, pesoMax: "0", pesoUlt: "0", ayuda: false)

let eje4   = EjercicioModel(nombre: "Biceps pesas", series: series, pesoMax: "0", pesoUlt: "0", ayuda: false)

let eje5   = EjercicioModel(nombre: "Peck deck", series: series, pesoMax: "0", pesoUlt: "0", ayuda: false)

let eje6   = EjercicioModel(nombre: "Biceps barra", series: series, pesoMax: "0", pesoUlt: "0", ayuda: false)

let fech = "11/2/22"

var cuento:Int = 0


struct detalle: View {
    let titulo:String
    let ejercicios:[EjercicioModel]
    let fecha:String

    
    var body: some View {
        
        
        NavigationView{
            
            VStack(alignment: .center){
                HStack{
                    Text("\(fecha)").font(.title2)
                    Image(systemName: "calendar")
                }
                List{
                    ForEach(ejercicios, id:\.nombre){ ejercicio in
                        
                        VStack(alignment: .center){
                              
                                Text("\(ejercicio.nombre)")
                                    .font(.headline)
                            Section{
                                ForEach(ejercicio.series, id:\.id){ serie in
                                Grid{
                                    GridRow{
                                        Text ("Repeticiones:")
                                        Text("\(serie.repeticiones)")
                                        Spacer()
                                        Text("\(serie.peso)")
                                        Text("Kg")
                                    }
                                }
                            }
                            Spacer()
                            Spacer()
                        }
                    }
                }
                }
                .toolbar{
                    ToolbarItem(placement: .principal){
                        HStack{
                            Text("\(titulo)").font(.title).fontWeight(.bold)
                            Image(systemName: "swift")
                        }
                    }
                }
            }
        }
    }
}

struct detalle_Previews: PreviewProvider {
    static var previews: some View {
        detalle(titulo: "Día de ejemplo", ejercicios: [eje1, eje2,eje3,eje4,eje5,eje6], fecha: fech)
    }
}


private func contador (cuenta: Int)->Int{
    cuento += 1
    return (cuento)
}
