//
//  GameModels.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/15/24.
//

import Foundation

struct Games:Codable ,Hashable{
   
    
    var games:[Game]
}
// MARK: - Game
struct Game: Codable,Hashable {
    let title, studio, contentRaiting, publicationYear: String
    let description: String
    let platforms, tags: [String]
    let videosUrls: VideosUrls
    let galleryImages: [String]
}

// MARK: - VideosUrls
struct VideosUrls: Codable ,Hashable {
    let mobile, tablet: String
}
