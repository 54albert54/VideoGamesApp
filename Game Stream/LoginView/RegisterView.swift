//
//  RegisterView.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/11/24.
//

import SwiftUI


struct RegisterView:View{
    @State var hasCorreo = ""
    @State var hasPassword = ""
    @State var confirmPassword = ""
    var body: some View{
        VStack{
            PerfilImageAdd()
            InputLogin(textData: hasCorreo, textTitle: "Email", textPlaceholder: "example@gmail.com")
           InputLogin(textData: hasPassword, textTitle: "Password", textPlaceholder: "password",isSafe:true)
            InputLogin(textData: confirmPassword, textTitle: "Confirm Password", textPlaceholder: "password",isSafe:true)
            
            UIButtonSeccion(title: "Registrate", actions: {print("hola soy un button")}).padding()
        }
       
    }
    
}

#Preview {
    RegisterView()
}
