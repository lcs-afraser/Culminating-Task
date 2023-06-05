//
//  PlaylistView.swift
//  Culminating Task
//
//  Created by Alistair Fraser on 2023-06-02.
//

import SwiftUI

struct PlaylistView: View {
    
    //MARK: Stored Properties
    
    // Is the interface to show a song visable right now
    @State var showingAddSongView = false
    
    //MARK: Computed Properties
    var body: some View {
        
        NavigationView {
            Text("Playlist view")
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
    }
}
