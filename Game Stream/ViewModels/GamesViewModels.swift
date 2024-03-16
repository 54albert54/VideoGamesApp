//
//  GamesViewModels.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/15/24.
//

import Foundation
//1.create a clas ObservableObject
class GamesViewModel:ObservableObject{
    //2.banding all the public propities with @Published
    @Published var gamesDetails = [Game]()
    @Published var gamesFavorites = [Game]()
    @Published var feedBackDectails:[FeedBack] = [
        FeedBack(userName:"RAGNAROL",userImg: "https://jobcontent.com.br/conteudos-do-sitio/uploads/2017/12/O-que-e-persona-em-marketing-digital-550x290.jpg", time: "1hr ago", detailFeedBack: "El juego 'The Last of Us Part II' es una obra maestra del storytelling interactivo. La profundidad de los personajes, combinada con una narrativa emocionante y gráficos impresionantes, crea una experiencia inolvidable. Además, la jugabilidad fluida y los intensos momentos de acción mantienen al jugador inmerso en el mundo postapocalíptico durante horas."),
        FeedBack(userName:"anaLisa",userImg: "https://neilpatel.com/wp-content/uploads/2019/07/entenda-o-perfil-de-compra-da-buyer-persona.jpeg", time: "4hr ago", detailFeedBack: "Como fanático de los juegos de rol, 'The Witcher 3: Wild Hunt' es simplemente excepcional. La vasta y hermosa tierra de fantasía, repleta de misiones intrigantes y decisiones morales impactantes, ofrece una experiencia única en cada partida. Los personajes bien escritos y las historias conmovedoras hacen que cada momento valga la pena."),
        FeedBack(userName:"marioBros",userImg: "https://neilpatel.com/wp-content/uploads/2019/07/profissional-sorridente-trabalhando-na-criacao-de.jpeg", time: "2hr ago", detailFeedBack: "La saga 'Dark Souls' es conocida por su desafiante dificultad y su diseño de niveles meticuloso. Cada encuentro con un enemigo es una prueba de habilidad y paciencia, y cada victoria se siente como un logro personal. Aunque puede ser frustrante en ocasiones, la sensación de triunfo al superar un jefe difícil es incomparable en el mundo de los videojuegos."),
    ]
    
    let urlBase = "https://gamestreamapi.herokuapp.com/api/games"
    //3. make a init with all necesarie
    init(){
        getDataGame()
    }
    
    //4. for call a API
    private func getDataGame(){
        //4.1 create a url from a STRING
        guard let url = URL(string: urlBase) else {
            return
        }
        //4.2 create a URLreques with url
        var request = URLRequest(url: url)
        //4.3 add the method for this call
        request.httpMethod = "GET"
        //4.4 make the URLSeccion ->shared->dataTask
        URLSession.shared.dataTask(with: request) { dataApi, response, error in
            //4.5 create a decode from data Json
            let decodeData = JSONDecoder()
            
            do{
                //5 confirm if we have response
                if let data = dataApi {
                    //5.1 try to decode de data with the ModelInfo from de resoponse data
                   let gameData = try decodeData.decode([Game].self, from: data)
                    //6 send to de other thread the operation for popilate the array
                    
                    DispatchQueue.main.async {
                        //7 add the data to the variant published
                        self.gamesDetails.append(contentsOf: gameData)
                      //  self.aGamesDetail = gameData.first
                    }

                }
            } catch{
                //7 handler error
                print("Error with get data \(error)")
            }
        }.resume() //URLSessicion need to be resime() for start the call
    }
    
    func searchGame(by title:String)->[Game]?{
        return self.gamesDetails.filter { $0.title.localizedLowercase.hasPrefix(title.localizedLowercase)  }
    }
    func addToFavorite(game: Game){
        if !gamesFavorites.contains(game){
            gamesFavorites.append(game)
            print(gamesFavorites.count)
        }
        gamesFavorites.append(game)
        print(gamesFavorites.count)
        
        print("----------\(gamesFavorites.count)")
    }
    
}
