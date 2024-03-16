//
//  HomeView.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/13/24.
//

import SwiftUI
import AVKit


struct HomeTabVarView: View {
    @State var tagSelected:Int = 1
    
    var body: some View {
        NavigationStack{
            TabView(selection: $tagSelected)
             {
                PerfilView().font(.system(size: 30,weight: .bold ,design: .rounded))
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Perfil")
                    }.tag(0)
              
                JuegosView().font(.system(size: 30,weight: .bold ,design: .rounded))
                    .tabItem {
                        Image(systemName: "gamecontroller.fill")
                        Text("Juegos")
                    }.tag(2)
                 HomeView().font(.system(size: 30,weight: .bold ,design: .rounded))
                     .tabItem {
                         Image(systemName: "house")
                         Text("Inicio")
                     }.tag(1)
                FavoritosView().font(.system(size: 30,weight: .bold ,design: .rounded))
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favoritos")
                    }.tag(3)
                 SettingsView().font(.system(size: 30,weight: .bold ,design: .rounded))
                     .tabItem {
                         Image(systemName: "gearshape.fill")
                         Text("Options")
                     }.tag(4)
                    
            }
        }.navigationBarBackButtonHidden(true) // Oculta el botón de retroceso
            
            
        
    }
    
  
}

#Preview {
    HomeTabVarView()
}






struct SettingsView:View{
    var body: some View{
        Text("Settigs")
    }
}



