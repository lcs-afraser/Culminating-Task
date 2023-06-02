//
//  Song.swift
//  Culminating Task
//
//  Created by Alistair Fraser on 2023-06-02.
//

import Foundation

struct Song: Codable {
    
    let trackId: Int
    let artistName: String
    let trackName: String
    let artistViewUrl: String
    let collectionViewUrl: String
    let previewUrl: String
    let artworkUrl100: String
    
}
