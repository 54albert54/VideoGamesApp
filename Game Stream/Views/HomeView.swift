//
//  HomeView.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/14/24.
//

import SwiftUI
import AVKit

struct HomeView:View{
    @State var textoBuscado = ""
    @State var isShowVideo = false
    @State var isShowResultVideo = false
    @State var isAlertTextSearch = false
    @State var msjAlert = "Alerta"
    @State var gameFound = [Game]()
    @State var urlVideo = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @ObservedObject var gameViewModel = GamesViewModel()
        
    
    
    
    @State var videoIndex = 0
    var imgArray = [
        "cuphead":"https://dl.dropboxusercontent.com/s/x08o6ihojmwpqjm/CupheadMax.mp4",
        "halo":"https://dl.dropboxusercontent.com/s/fwa3k95ga2kx849/Halo480.mp4",
        "abzu":"https://dl.dropboxusercontent.com/s/vojqso0c5ise1bh/Abzu480.mp4",
    ]
    var body: some View{
        ScrollView{
            ZStack{
                Color("TabBarColor")
                VStack{
                    Image("AppLogo").resizable().frame(width: 250, height: 30).padding()
                    //searchBar
                    HStack{
                        Button(action: buscar) {
                            Image(systemName: "magnifyingglass").resizable().foregroundStyle(textoBuscado.isEmpty ? Color.white : Color.white).frame(width: 16 ,height:16 ).padding(.leading)
                        }
                   
                        ZStack(alignment: .leading){
                            if textoBuscado.isEmpty {
                                Text("Buscar ").font(.body).fontWeight(.light).foregroundStyle(.white).padding(3.0)
                            }
                            TextField("", text: $textoBuscado)
                                .fontWeight(.light)
                                .padding(3.0).foregroundStyle(Color.white)
                                .font(.system(size: 16))
                        }.alert(Text(msjAlert), isPresented: $isAlertTextSearch) {
                            Text("Cancel")
                        }
                        
                        
                        
                    }.background(Color("blueSoft")).clipShape(Capsule()).padding(.horizontal)
                    //body
                    VStack(alignment:.leading){
                        HStack{
                            Text("LOS MAS POPULARES").font(.system(size: 20,weight: .semibold)).multilineTextAlignment(.leading).foregroundStyle(.white).padding(.horizontal)
                            Spacer()
                        }
                        VStack{
                            ZStack{
                                Button {
                                    urlVideo = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
                                    isShowVideo = true
                                     
                                } label: {
                                    ZStack{
                                        Image("mainPhoto").resizable().scaledToFit()
                                        Image(systemName: "play.circle.fill").resizable().frame(width: 80,height: 80).foregroundStyle(.white)
                                        
                                    }
                                    
                                }
                                
                                NavigationLink(
                                     destination:VideoPlayer(player :AVPlayer(url: URL(string: urlVideo)!))
                                    , isActive: $isShowVideo){
                                        EmptyView()
                                    }
                                NavigationLink(
                                     destination:SearchView(result: gameFound)
                                    , isActive: $isShowResultVideo){
                                        EmptyView()
                                    }
                            }
                            CreateTitle(title: "the witcher 3: Wild Hunt").padding(.bottom)
                        }.background(Color("blueSoft"))
                        //Seccion
                        CreateTitle(title: "CATEGORIAS SUGERIDAS PARA TI").padding(.bottom)
                        ScrollView(.horizontal ,showsIndicators: false){
                            HStack{
                                ButtonCategory(title: "FPS")
                                ButtonCategory(title: "OpenWorld")
                                ButtonCategory(title: "RPG")
                              
                            }.padding(.horizontal)
                        }
                        
                        CreateTitle(title: "RECOMENDADO PARA TI").padding(.bottom)
                        ScrollView(.horizontal ,showsIndicators: false){
                            HStack{
                                
                                ForEach(imgArray.sorted(by: {$0.key < $1.key }) , id:\.key){ (key ,value) in
                                    Button(action: {
                                        urlVideo = value
                                        isShowVideo = true
                                        
                                    }
                                           , label: {
                                        Image(key).resizable().frame(width: 260 , height:160).cornerRadius(8.0)
                                    })
                                }
                            }.padding(.horizontal)
                        }
                        CreateTitle(title: "Comming soon").padding(.bottom)
                                otherGame(title:"JUEGOS QUE PODRIAN GUSTARTE")
                    }
                }
            }
        }
        
        
    }
    func buscar (){
        if !textoBuscado.isEmpty{
            if let response = gameViewModel.searchGame(by: textoBuscado){
                if response.count != 0 {
                    gameFound = response
                    isShowResultVideo = true
                }else{
                    msjAlert = "Game no found"
                    isAlertTextSearch = true
                }
            }
            //
        }else{
            msjAlert = "Empty"
            isAlertTextSearch = true
        }
    }
}

#Preview {
    NavigationStack{
        HomeView()
    }
    
}

