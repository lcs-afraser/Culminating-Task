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
    
    
    //Access the connection to the database (needed to add a new record)
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?

    //The list of added songs
    @BlackbirdLiveModels({ db in
        try await SavedSong.read(from: db)
    }) var songs
    
    // Is the interface to show a song visable right now
    @State var showingAddSongView = false
    
    //MARK: Computed Properties
    var body: some View {
        
        NavigationView {
            List {
                ForEach(songs.results) { currentSong in
                    VStack(alignment: .leading) {
                        
                        HStack {
                            
                            RemoteImageView(urlOfImageToShow: currentSong.artworkUrl100)
                            
                            VStack(alignment: .leading) {
                                
                                Text(currentSong.trackName)
                                    .font(.title)
                                    .bold()
                                
                                Text(currentSong.collectionName)
                                    .font(.title3)
                                
                                Text(currentSong.artistName)
                                    .font(.subheadline)
                                
                            }
                            
                        }
                        
                        AudioPlayerView(urlOfAudioToPlay: currentSong.previewUrl)
                            .padding(.horizontal, 5)
                        
                        
                    }
                    
                }
                .onDelete(perform: removeRows)
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
    
    //MARK: Functions
    func removeRows(at offsets: IndexSet) {
        Task {
            try await db!.transaction { core in
                
                //Get the ID of the item to be deleted
                var idList = ""
                for offset in offsets {
                    idList += "\(songs.results[offset].id),"
                }
                //Remove the final comma
                print(idList)
                idList.removeLast()
                print(idList)
                //Delete the rows from the database
                try core.query("DELETE FROM SavedSong WHERE id IN (?)", idList)
                
            }
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
