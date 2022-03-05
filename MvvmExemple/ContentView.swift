//
//  ContentView.swift
//  MvvmExemple
//
//  Created by Elliot Knight on 05/03/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var friendVM = FriendViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(friendVM.friends, id: \.self) {
                    Text($0)
                }
                .onDelete(perform: friendVM.deletFriend)
                .onMove(perform: friendVM.moveFriend)
            }
            .navigationTitle("My friends")
            .toolbar {
                EditButton()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
