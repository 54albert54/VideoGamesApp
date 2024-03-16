//
//  InicioView.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/11/24.
//

import SwiftUI

struct InicioView:View{
    @State var hasCorreo = ""
    @State var hasPassword = ""
    @State var isUserLogin:Bool = false
   
  
    var body: some View{
        VStack(alignment:.leading){
            InputLogin(textData: hasCorreo, textTitle: "Correro Electronico", textPlaceholder: "Tu Correo")
            InputLogin(textData: hasPassword, textTitle: "Contraseña", textPlaceholder: "Tu contraseña ", isSafe:true)
         
            
            Text("forget you passwords").frame(width: 350, alignment: .trailing).foregroundColor(Color("DarkCian")).padding(.vertical, 10.0)
            
            UIButtonSeccion(title: "INICIAR SECION", actions:{
                isUserLogin = true
            } ).padding()
            NavigationLink(destination: HomeTabVarView(), isActive: $isUserLogin) {
            EmptyView()
            }
        }.frame(width: 350).padding(.bottom, 23.0)
       
        
    }
    
}

#Preview {
    InicioView()
}
