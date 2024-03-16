//
//  JuegosView.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/15/24.
//

import SwiftUI
import Kingfisher

//CreateTitle(title: "All THE GAMES")
struct JuegosView:View{
    
    @ObservedObject var gameViewModel = GamesViewModel()
    
    @State var isShowDetailGame = false
    @State var detailGame:Game?
    private let sizeCard = [
        GridItem(.adaptive(minimum: 150, maximum: 180))
    ]
    
    var body: some View{
        
        
        
        ZStack {
            Color("TabBarColor")
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text("ALL THE GAMES").padding(.top)
                    .font(.title).foregroundStyle(.white).fontWeight(.semibold)
                
                
                ScrollView{
                    LazyVGrid(columns: sizeCard, spacing: 20) {
                        ForEach(gameViewModel.gamesDetails , id:\.self){ game in
                            Button {
                                detailGame = game
                                isShowDetailGame = true
                            } label: {
                                VStack{
                                    
                                    KFImage(URL(string: game.galleryImages[0])).resizable().frame(height:150).cornerRadius(8.0)
                                    
                                    Text(game.title).font(.system(size: 16,weight: .medium)).foregroundStyle(.white).multilineTextAlignment(.center).frame(height:20)
                                }.shadow(radius: 5)
                                
                            }
                            
                        }
                    }
                }
                NavigationLink(
                     destination:
                        GameDetailsView(forGame : detailGame)
                    , isActive: $isShowDetailGame){
                        EmptyView()
                    }
            }
        }
    }
}

#Preview {
    NavigationView{
        JuegosView()
    }
    
}



