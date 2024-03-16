//
//  LoginTitle.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/11/24.
//

import SwiftUI

struct LoginTitle: View {
    var moreInvento:()->Bool? = {
        return true
    }
    @State var isInicio = true
     var isLogin:Bool?
    
    var body: some View {
        VStack{
            Image("AppLogo").resizable().frame(width: 250, height: 30).padding()
            HStack{
                Spacer()
                Button {
                    isInicio = true
                } label: {
                    Text("INICIO SECCION")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(isInicio ? .white : .gray)
                }

                Spacer()
                Button {
                    isInicio = false
                } label: {
                    Text("REGISTRATE")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(!isInicio ? .white : .gray)
                }
                
                Spacer()
            }.padding()
            if isInicio {
                InicioView()
            }else{
                RegisterView()
            }
            
        }
    }
}

#Preview {
    LoginTitle()
}
