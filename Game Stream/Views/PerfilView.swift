//
//  PerfilView.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/16/24.
//

import SwiftUI

struct PerfilView: View {
    @State var areNotificationOn = true
    @State var goToEditPerfil = false
    var body: some View {
        ZStack{
            Color("TabBarColor")
            VStack{
                Text("Perfil").font(.system(size: 32,weight: .bold)).foregroundStyle(.white).padding(.vertical, 10.0)
                VStack{
                    Image("userPerfil").resizable().frame(width: 140,height: 100)
                    Text("User ").font(.system(size: 20,weight: .semibold)).foregroundStyle(.white)
                    CreateTitle(title: "AJUSTES")
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Text("Cuenta").font(.system(size: 20,weight: .regular))
                            Spacer()
                            Image(systemName: "arrow.right")
                        }.frame(width:320).padding().background(Color("blueSoft")).foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Text("Notoficaciones").font(.system(size: 20,weight: .regular))
                            Spacer()
                            
                            Toggle(isOn: $areNotificationOn ) {
                                EmptyView()
                            }
                        }.frame(width:320).padding().background(Color("blueSoft")).foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    })
                    
                    Button(action: {
                        goToEditPerfil = true
                    }, label: {
                        HStack {
                            Text("Editar perfil").font(.system(size: 20,weight: .regular))
                            Spacer()
                            Image(systemName: "arrow.right")
                        }.frame(width:320).padding().background(Color("blueSoft")).foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Text("Califica esta aplicacion").font(.system(size: 20,weight: .regular))
                            Spacer()
                            Image(systemName: "arrow.right")
                        }.frame(width:320).padding().background(Color("blueSoft")).foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    })
                }
                NavigationLink(
                    destination:EditPerfilView()
                    
                    , isActive: $goToEditPerfil){
                        EmptyView()
                    }
                
                Spacer()
            }
        }
    }
}

struct EditPerfilView:View{
    @State var hasCorreo = ""
    @State var hasPassword = ""
    @State var confirmPassword = ""
    var body: some View{
        ZStack{
            Color("TabBarColor")
            VStack{
                Text("Editar Perfil").font(.system(size: 32,weight: .bold)).foregroundStyle(.white).padding(.vertical, 10.0)
                VStack {
                    PerfilImageAdd()
                    InputLogin(textData: hasCorreo, textTitle: "Email", textPlaceholder: "example@gmail.com")
                    InputLogin(textData: hasPassword, textTitle: "Password", textPlaceholder: "password",isSafe:true)
                    InputLogin(textData: confirmPassword, textTitle: "Confirm Password", textPlaceholder: "password",isSafe:true)
                    
                    UIButtonSeccion(title: "ACTUALIZAR DATOS", actions: {print("hola soy un button")}).padding()
                }
            }
        }
    }
    
    
}

#Preview {
    NavigationView{
        PerfilView()
    }
    
}
