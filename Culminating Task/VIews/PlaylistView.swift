//
//  PlaylistView.swift
//  Culminating Task
//
//  Created by Alistair Fraser on 2023-06-02.
//

import Blackbird
import SwiftUI

struct PlaylistView: View {
    
    //MARK: Stored Properties
    
    //The list of added songs
    @BlackbirdLiveModels({ db in
        try await SavedSong.read(from: db)
    }) var songs
    
    // Is the interface to show a song visable right now
    @State var showingAddSongView = false
    
    //MARK: Computed Properties
    var body: some View {
        
        NavigationView {
            List(songs.results) { currentSong in
                Text(currentSong.trackName)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showingAddSongView = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $showingAddSongView) {
                AddSongView()
                    .presentationDetents([.fraction(0.3)])
            }
            .navigationTitle("Playlist Builder")
        }
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
        // Make the database available to all other views through the environment
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
