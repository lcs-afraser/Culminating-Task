//
//  SavedSongs.swift
//  Culminating Task
//
//  Created by Alistair Fraser on 2023-06-06.
//

import Blackbird
import Foundation

struct SavedSong: BlackbirdModel {
    
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var artistName: String
    @BlackbirdColumn var collectionName: String
    @BlackbirdColumn var trackName: String
    @BlackbirdColumn var artistViewUrl: String
    @BlackbirdColumn var collectionViewUrl: String
    @BlackbirdColumn var previewUrl: String
    @BlackbirdColumn var artworkUrl100: String
    
}
