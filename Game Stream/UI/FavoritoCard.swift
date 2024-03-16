//
//  FavoritoCard.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/15/24.
//

import SwiftUI
import Kingfisher

struct FavoritoCard:View{
    @State var isShowVideo = false
    var game:Game
    var urlVideo = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    var body:some View{
        VStack{
            ZStack{
                Button {
                    
                    isShowVideo = true
                    
                } label: {
                    VStack(spacing:0){
                        ZStack{
                            KFImage(URL(string:game.galleryImages[0]))
                                .resizable().scaledToFit()
                            Image(systemName: "play.circle.fill").resizable().frame(width: 80,height: 80).foregroundStyle(.white)
                            
                        }
                        Text(game.title).foregroundStyle(.white).frame(width:390, height:40).background(Color("blueSoft"))
                    }
                   
                    
                }
            }
        }
    }
}


#Preview {
    FavoritoCard(game:dummyData[0])
}
