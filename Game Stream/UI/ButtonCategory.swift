//
//  ButtonCategory.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/14/24.
//

import SwiftUI

struct ButtonCategory:View{
     var title:String
    var body: some View{
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            VStack{
                Image(title).resizable().scaledToFit().fontWeight(.semibold).frame(width: 30,height: 30, alignment: .center)
                Text(title).foregroundStyle(Color("DarkCian")).font(.system(size: 20,weight: .semibold))
            }.frame(width:  220, height: 120)
                .background(Color("blueSoft")).foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
            
        })
    }
}

#Preview {
    ButtonCategory(title: "prueba")
}
