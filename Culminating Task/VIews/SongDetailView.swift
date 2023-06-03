//
//  SongDetailView.swift
//  SongFinder
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

struct SongDetailView: View {
    
    // MARK: Stored properties
    
    // Song to show in this view
    var songToShow: Song
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                RemoteImageView(urlOfImageToShow: songToShow.artworkUrl100)
                
                VStack(alignment: .leading) {
                    
                    Text(songToShow.trackName)
                        .font(.title)
                    
                    Text(songToShow.artistName)
                        .font(.subheadline)
                    
                }
                
            }
            
            AudioPlayerView(urlOfAudioToPlay: songToShow.previewUrl)
            .padding(.top, 20)
            .padding(.horizontal, 5)
            
            Text("Store Links")
                .font(.title2)
                .bold()
                .padding(.top, 20)
            
            Link("View artist", destination: URL(string: songToShow.artistViewUrl)!)
                .padding(.top, 5)
            
            Link("View album", destination: URL(string: songToShow.collectionViewUrl)!)
                .padding(.top, 5)

            
            Spacer()
                .frame(maxWidth: .infinity)
            
        }
        .padding()
        // Make the nav bar be "small" at top of view
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct SongDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            SongDetailView(songToShow: exampleSong)
        }
    }
                           
}
