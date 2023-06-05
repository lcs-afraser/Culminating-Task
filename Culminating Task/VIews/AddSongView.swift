//
//  AddSongView.swift
//  Culminating Task
//
//  Created by Alistair Fraser on 2023-06-05.
//

import SwiftUI

struct AddSongView: View {
    //MARK: Stored Properties
    
    //Holds the list of songs returned by our search
    @State var foundSongs: [Song] = []
    
    //Holds the song name that is being searched
    @State var searchText = ""
    
    //MARK: Computed Properties
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Enter a song name", text: $searchText)
                
                Button(action: {
                    Task {
                        //Fetch search results for whatever is searched
                        foundSongs = await NetworkService.fetch(resultsFor: searchText)
                    }
                }, label: {
                    Text("Load results")
                })
                .buttonStyle(.borderedProminent)
                
                ScrollView {
                    
                    ForEach(foundSongs, id: \.trackId) { currentSong in
                        
                        VStack {
                            
                            Divider()
                            
                            HStack {
                                
                                RemoteImageView(urlOfImageToShow: currentSong.artworkUrl100)
                                
                                Text(currentSong.trackName)
                                    .bold()
                                
                                Spacer()
                            }
                            Text(currentSong.collectionName)
                                .italic()
                            
                            Text(currentSong.artistName)
                            
                            AudioPlayerView(urlOfAudioToPlay: currentSong.previewUrl)
                                .padding(.top, 2)
                                .padding(.horizontal, 5)
                        }
                    }
                }
            }
        }
    }
}


struct AddSongView_Previews: PreviewProvider {
    static var previews: some View {
        AddSongView()
    }
}
