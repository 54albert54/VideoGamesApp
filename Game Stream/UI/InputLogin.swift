//
//  InputLogin.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/11/24.
//

import SwiftUI

struct InputLogin:View{
    @State var textData:String
    @State var textTitle:String
    @State var textPlaceholder:String
    var isSafe:Bool?
    var body: some View{
        Text("hola").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading).padding()
        VStack(spacing:2){
            HStack{
                Text(textTitle)
                    .foregroundColor(Color("DarkCian"))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            ZStack(alignment: .leading){
                if textData.isEmpty{
                    Text(textPlaceholder).foregroundColor(.gray)
                }
                if isSafe ?? false  {
                  
                    SecureField("", text: $textData).foregroundColor(.white)
                }else{
                   
                    TextField("", text: $textData).foregroundColor(.white)
                }
                
            }
            
//            GeometryReader { geometry in
            Divider().frame( height: 1).background(textData.isEmpty ? Color.gray :Color("DarkCian"))
//            }
         
            
        }.padding()
    }
}

#Preview {
    InputLogin(textData: "prueba", textTitle: "prueba", textPlaceholder: "prueba",isSafe:true)
}
