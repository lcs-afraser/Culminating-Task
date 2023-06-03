//
//  PlaylistView.swift
//  Culminating Task
//
//  Created by Alistair Fraser on 2023-06-02.
//

import SwiftUI

struct PlaylistView: View {
    
    //MARK: Stored Properties
    
    //Holds the list of songs returned by our search
    @State var foundSongs: [Song] = []
    
    //Holds the song name that is being searched
    @State var searchText = ""
    
    //MARK: Computed Properties
    var body: some View {
        
        
        NavigationView {
            
            
            //        .toolbar {
            //            ToolbarItem(placement: .primaryAction) {
            //                Button(action: {
            //                    showingAddMovieView = true
            //                }, label: {
            //                    Image(systemName: "plus")
            //                })
            //                .sheet(isPresented: $showingAddMovieView) {
            //                    AddMovieView()
            //                        .presentationDetents([.fraction(0.3)])
            //                }
            //            }
            //        }
            List(foundSongs, id: \.trackId) { currentSong in
                VStack(alignment: .leading) {
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
            .searchable(text: $searchText)
            .onChange(of: searchText) { newSearchText in
                Task {
                    //Fetch search results for whatever is searched
                    foundSongs = await NetworkService.fetch(resultsFor: newSearchText)
                }
            }
        }
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}
