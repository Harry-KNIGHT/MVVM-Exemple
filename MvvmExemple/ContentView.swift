//
//  ContentView.swift
//  MvvmExemple
//
//  Created by Elliot Knight on 05/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            FriendsListView()
                .tabItem {
                    Label("Friends", systemImage: "person.3.fill")
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
