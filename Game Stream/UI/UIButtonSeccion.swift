//
//  UIButtonSeccion.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/10/24.
//

import SwiftUI

struct UIButtonSeccion: View {
    var title:String!
    var actions: ()->Void
    var body: some View {
        ZStack{
            
            Button(action: actions)  {
                Text(title).fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 350,height: 50)
                    
                    .cornerRadius(/*@START_MENU_TOKEN@*/9.0/*@END_MENU_TOKEN@*/)
                    .overlay(RoundedRectangle(cornerRadius: 16.0)
                        .stroke(Color("DarkCian"),lineWidth: 3.0)
                        .shadow(color:Color("DarkCian"),radius: 3))
            }
            
        }.background(Color(red:19/255,green:30/255, blue:53/255))
    }
        
    }

#Preview {
    UIButtonSeccion(title: "prueba",actions:{
        print("hola")
    })
}


