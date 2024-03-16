//
//  FavoritosView.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/15/24.
//

import SwiftUI
import Kingfisher

struct FavoritosView:View{
    @ObservedObject var gameViewModel = GamesViewModel()
//    @State var data:[Game]{
//        return self.gameViewModel.gamesFavorites
//    }
    var body: some View{
        
        ZStack{
            Color("TabBarColor")
            
            ScrollView {
                VStack(alignment:.center) {
                    CreateTitle(title: "Tus Favoritos").padding()
                    
                    VStack(spacing:30){
                        ForEach(gameViewModel.gamesDetails , id:\.self){ favorite in
                            FavoritoCard(game:favorite)
                        }
                    }
                    Spacer()
                }
            }
        }
        
    }
}


#Preview {
    FavoritosView( )
}


