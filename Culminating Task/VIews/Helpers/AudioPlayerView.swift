//
//  AudioPlayerView.swift
//
//  Created by Russell Gordon on 2021-02-20.
//
//  LICENSE:
//  This work is licensed under CC BY-NC-SA 4.0
//  https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1

import AVKit
import SwiftUI

// ADAPTED FROM SOURCE: https://medium.com/swift-productions/swiftui-play-an-audio-with-avaudioplayer-1c4085e2052c
//
// NOTE: It is also possible to play audio from files in the app bundle.

struct AudioPlayerView: View {
    
    // MARK: Stored properties
    
    // Used to play the audio
    @State var audioPlayer: AVPlayer = AVPlayer()
    
    // What remote link
    let urlOfAudioToPlay: String
    
    // Whether an audio file is playing
    @State var isAudioPlaying = false
    
    // Whether control is enabled or not; by default it is enabled
    @State var playerDisabled = false
    
    // MARK: Stored properties
    var body: some View {
        
        ZStack {
            
            Button(action: {
                audioPlayer.play()
                isAudioPlaying = true
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
            }
            // Visible only when song is not playing
            .opacity(isAudioPlaying == false ? 1.0 : 0.0)
            // Disabled if the URL provided was not valid
            .disabled(playerDisabled == true ? true : false)
            
            Button(action: {
                audioPlayer.pause()
                isAudioPlaying = false
            }) {
                Image(systemName: "pause.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
            }
            // Visible only when song IS playing
            .opacity(isAudioPlaying == true ? 1.0 : 0.0)
        }
        .onAppear {
            
            // Create a URL instance from the preview URL
            if let url = URL(string: urlOfAudioToPlay) {

                // Make an instance of AVPlayerItem
                let playerItem = AVPlayerItem(url: url)
                
                // Reset instance of AVPlayer
                audioPlayer = AVPlayer(playerItem: playerItem)
                
                // Set the volume
                audioPlayer.volume = 0.5

            } else {
                
                // Disable the player control
                playerDisabled = true
                
            }
            
        }
        .onDisappear() {
            isAudioPlaying = false
            audioPlayer.pause()
        }
    }
    
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {

        // Good URL example
        AudioPlayerView(urlOfAudioToPlay:  "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview118/v4/4d/80/bb/4d80bb0d-5b66-7c09-056c-4dbae131e0c4/mzaf_6323814923022681502.plus.aac.p.m4a")
        
        // Bad URL example
        AudioPlayerView(urlOfAudioToPlay: "")

    }
}
