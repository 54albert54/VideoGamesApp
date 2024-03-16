//
//  ContentView.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/10/24.
//

import SwiftUI

struct ContentView: View {
    
  
   
        
    var body: some View {
        NavigationStack{
            
         
            
            ZStack {
                Color("mainColor").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    LoginTitle()
                    OtherButoons()
                    Spacer()
                }
            }.background()
        
        }
    }
}

#Preview {
        ContentView()
}








