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
    let collectionName: String
    let trackName: String
    let artistViewUrl: String
    let collectionViewUrl: String
    let previewUrl: String
    let artworkUrl100: String
    
}

let exampleSong = Song(trackId: 1440936016,
                       artistName: "Taylor Swift",
                       collectionName: "Pop",
                       trackName: "Shake It Off",
                       artistViewUrl: "https://music.apple.com/us/artist/taylor-swift/159260351?uo=4",
                       collectionViewUrl: "https://music.apple.com/us/album/shake-it-off/1440935467?i=1440936016&uo=4",
                       previewUrl: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview118/v4/4d/80/bb/4d80bb0d-5b66-7c09-056c-4dbae131e0c4/mzaf_6323814923022681502.plus.aac.p.m4a",
                       artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/9c/91/83/9c918303-e0a4-2d4b-97d6-f986b9fba604/source/100x100bb.jpg")
