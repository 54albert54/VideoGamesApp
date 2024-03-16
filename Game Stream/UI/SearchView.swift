//
//  SearchView.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/15/24.
//

import SwiftUI

struct SearchView:View{
    var result:[Game]
    @State var detailGame:Game?
    @State var showOtherGame = false
    
    
    var body: some View{
        NavigationView {
            ZStack{
                Color("TabBarColor")
                VStack(alignment: .center){
                    
                    CreateTitle(title: "Resultado").frame(height: 40,alignment: .bottom).padding(.vertical)
                    
                    VStack(alignment: .leading){
                        
                        ForEach(result, id: \.self) { game in
                            
                            Button(action: {
                                detailGame = game
                                showOtherGame = true
                            }, label: {
                                HStack {
                                    Text(game.title).font(.system(size: 20,weight: .regular))
                                    Spacer()
                                    Image(systemName: "arrow.right")
                                }.frame(width:320).padding().background(Color("blueSoft")).foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                            })
                        }
                    }
                    Spacer()
                }
                NavigationLink(
                    destination:  GameDetailsView(forGame : detailGame)
                    , isActive: $showOtherGame){
                        EmptyView()
                    }
                
            }
            
        } }
}


var dummyData = [Game(
    title: "Hades",
    studio: "Supergiant Games",
    contentRaiting: "T",
    publicationYear: "2020",
    description: "Defy the god of the dead as you hack and slash out of the Underworld in this rogue-like dungeon crawler from the creators of Bastion, Transistor, and Pyre.",
    platforms: ["PC", "Nintendo Switch", "macOs"],
    tags: ["Action", "Indie", "RPG"],
    videosUrls: Game_Stream.VideosUrls(
        mobile: "https://dl.dropboxusercontent.com/s/8p42umyiqoku18r/Hades480.mp4",
        tablet: "https://dl.dropboxusercontent.com/s/5juhj8blz131wdq/HadesMax.mp4"),
    galleryImages: [
        "https://cdn.cloudflare.steamstatic.com/steam/apps/1145360/ss_c0fed447426b69981cf1721756acf75369801b31.600x338.jpg", "https://cdn.cloudflare.steamstatic.com/steam/apps/1145360/ss_8a9f0953e8a014bd3df2789c2835cb787cd3764d.600x338.jpg", "https://cdn.cloudflare.steamstatic.com/steam/apps/1145360/ss_217b70678a2eea71a974fba1a4cd8baa660581bb.600x338.jpg"])]

#Preview {
    NavigationView{
        SearchView(result: dummyData)
    }
    
}
