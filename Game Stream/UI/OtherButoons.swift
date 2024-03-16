//
//  OtherButoons.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/11/24.
//

import SwiftUI

struct OtherButoons: View {
    var body: some View {
       
        
        ZStack{
            
         
            VStack{
                Text("Inicia Secion con redes sociales").foregroundColor(.white)
                HStack(spacing:40){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Facebook").fontWeight(.semibold).frame(width: 120,height: 40, alignment: .center).background(Color("blueSoft")).foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Twitter").fontWeight(.semibold).frame(width: 120,height: 40, alignment: .center).background(Color("blueSoft")).foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    })
                }
                
            }.padding(.top, 20.0)
            
        }
    }
}

#Preview {
    OtherButoons()

}
