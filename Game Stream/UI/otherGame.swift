//
//  otherGame.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/15/24.
//

import SwiftUI
import Kingfisher

struct otherGame:View{
    var title:String
    var forGame:Game?
    @State var detailGame:Game?
    @State var showOtherGame = false
    @ObservedObject var gameViewModel = GamesViewModel()
    
    var GameToPrebius:[Game]  {
        guard let forGameP = forGame else{
            let allGame = gameViewModel.gamesDetails.shuffled()
            return Array(allGame.prefix(3))
        }
        let gameFilter = gameViewModel.gamesDetails.filter { $0.title != forGameP.title }.shuffled()
        return Array(gameFilter.prefix(3))
    }
   
    var body: some View{
        VStack{
            CreateTitle(title: title)
            ScrollView(.horizontal ,showsIndicators: false){
                HStack{
                    ForEach(GameToPrebius ,id:\.self){ game in
                        
                        
                        Button {
                            detailGame = game
                            showOtherGame = true
                        } label: {
                            ZStack{
                                
                                KFImage(URL(string: game.galleryImages[0])).resizable().frame(width:240, height:150).cornerRadius(8.0)
                                
                                Text(game.title).font(.system(size: 20,weight: .semibold)).foregroundStyle(.white).multilineTextAlignment(.center).frame(width:200,height:20).background(.black).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            }.shadow(radius: 5)
                            
                        }
                        

                        
                        
                    }
                }
            }
        }
        
        
        NavigationLink(
             destination:  GameDetailsView(forGame : detailGame)
            , isActive: $showOtherGame){
                EmptyView()
            }
    }
}

#Preview {
    ZStack{
        Color.blue
        otherGame(title:"preview")
    }
    
}
