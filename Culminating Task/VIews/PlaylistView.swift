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
            List(foundSongs, id: \.trackId) { currentSong in
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(currentSong.trackName)
                            .bold()
                        
                        Spacer()
                    }
                    Text(currentSong.collectionName)
                        .italic()
                    
                    Text(currentSong.artistName)
                }
            }
            .searchable(text: $searchText)
            .task {
                //When the view appears fetch search results
                foundSongs = await NetworkService.fetch(resultsFor: "As it was")
            }
        }
        // Show a list of songs that match the current search term

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
        
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}
