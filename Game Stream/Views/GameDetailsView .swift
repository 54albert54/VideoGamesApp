//
//  GameDetailsView .swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/15/24.
//

import SwiftUI
import Kingfisher
import AVKit

struct GameDetailsView :View{
    @State var isShowVideo = false
    @State var isGoToHome = false
    @State var isGamefavorite = false
    @State var urlVideo = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    var forGame:Game?
 
    
    var body: some View{
        NavigationView{
            ZStack{
                Color("TabBarColor")
                ScrollView{
                    if let gameDetail = forGame {
                        //Hero
                        ZStack{
                            VideoPlayer(player: AVPlayer(url: URL(string: gameDetail.videosUrls.mobile)!))
                                .frame(width: .infinity, height: 240)

                        }
                        
                        DectailInfoGame(gameDetail: gameDetail, isGamefavorite: isGamefavorite)
                       
                        GameCategoriy(tags:gameDetail.tags)
                        ComentariesSeccion()
                       
                        GameGalerie(galleryImages:gameDetail.galleryImages)
                        
                        
                    }
                    
                    otherGame(title:"JUEGOS SEMILARES" , forGame:forGame)
                }.padding(.bottom, 10.0)
                
            }
           
        } .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                Button(action: {
                                    isGoToHome = true
                                }) {
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(.blue)
                                }
                            )
    
       
        NavigationLink(
             destination:VideoPlayer(player :AVPlayer(url: URL(string: urlVideo)!))
            , isActive: $isShowVideo){
                EmptyView()
            }
        NavigationLink(
             destination:HomeTabVarView(tagSelected: 2)
            , isActive: $isGoToHome){
                EmptyView()
            }
        
    }
    
}




#Preview {
    NavigationView{
        GameDetailsView(forGame:Game(
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
                 "https://cdn.cloudflare.steamstatic.com/steam/apps/1145360/ss_c0fed447426b69981cf1721756acf75369801b31.600x338.jpg", "https://cdn.cloudflare.steamstatic.com/steam/apps/1145360/ss_8a9f0953e8a014bd3df2789c2835cb787cd3764d.600x338.jpg", "https://cdn.cloudflare.steamstatic.com/steam/apps/1145360/ss_217b70678a2eea71a974fba1a4cd8baa660581bb.600x338.jpg"]))
    }
    
}





struct DectailInfoGame: View {
    @ObservedObject var gameViewModel = GamesViewModel()
    var gameDetail:Game
     var isGamefavorite:Bool 
    var body: some View {
        HStack{
            Text(gameDetail.title).font(.system(size: 43,weight: .bold)).multilineTextAlignment(.leading).padding(.horizontal).foregroundStyle(.white)
            Spacer()
            Button {
                gameViewModel.addToFavorite(game: gameDetail)
            } label: {
                Image(systemName: isGamefavorite ? "heart.fill" : "heart").padding(.trailing, 23.0).font(.system(size: 26)).foregroundStyle(.white)
            }
            
        }
        VStack{
            HStack{
                Text(gameDetail.studio).font(.system(size: 16,weight: /*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)).foregroundStyle(.white)
                Text(gameDetail.contentRaiting)
                Text(gameDetail.publicationYear)
            }.foregroundStyle(.gray).font(.system(size: 16,weight: .semibold))
            
           
        }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal)
        
        Text(gameDetail.description)
            .frame(width: .infinity, height: .infinity).padding(.all).foregroundStyle(.white)
    }
}

struct GameCategoriy: View {
    var tags:[String]
    var body: some View {
        CreateTitle(title: "GATEGORIAS" ).padding(.leading)
        HStack{
            ForEach(tags, id: \.self) { tag in
                Text(tag).fontWeight(.semibold).frame(width: 120,height: 40, alignment: .center).background(Color("blueSoft")).foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
            }
        }.frame(maxWidth: .infinity, alignment: .leading).padding()
    }
}
struct ComentariesSeccion:View {
    @ObservedObject var gameViewModel = GamesViewModel()
    var body: some View {
        VStack{
            CreateTitle(title: "COMENTARIOS" ).padding(.leading)
            ForEach(gameViewModel.feedBackDectails , id:\.self) { feedback in
                CardFedBack(detail:feedback)
            }
        }
    }
}

struct GameGalerie: View {
    var galleryImages:[String]
    var body: some View {
        CreateTitle(title: "GALERIA" ).padding(.leading)
        ScrollView(.horizontal ,showsIndicators: false){
            LazyHStack{
            ForEach (galleryImages, id:\.self){ imgUrl in
                
                
                KFImage(URL(string:imgUrl)).resizable().frame(width:240, height:160).cornerRadius(8.0)
                }
            }
        }
    }
}


struct CardFedBack:View{
    var detail:FeedBack
    var body: some View{
        VStack(spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
            HStack{
                KFImage(URL(string:detail.userImg)).resizable().frame(width:40, height:40).cornerRadius(100.0)
                Text(detail.userName)
                Spacer()
            }.padding()
            Text(detail.detailFeedBack).font(.system(size: 12,weight: .regular)).padding([.leading, .bottom, .trailing], 8.0)
        }.fontWeight(.semibold).frame(width: 370 ,height: 190, alignment: .top).background(Color("blueSoft")).foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
    }
}
