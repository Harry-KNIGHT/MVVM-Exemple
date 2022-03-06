//
//  FriendsListView.swift
//  MvvmExemple
//
//  Created by Elliot Knight on 05/03/2022.
//

import SwiftUI

struct FriendsListView: View {
    @StateObject var friendVM = FriendViewModel()
    
    var body: some View {
        NavigationView {
            List {
                
                Section {
                    ForEach(friendVM.friends, id: \.self) {
                        Text($0)
                    }
                    .onDelete(perform: friendVM.deletFriend)
                    .onMove(perform: friendVM.moveFriend)
                }
                
                Section(header: !friendVM.newFriends.isEmpty ?  Text("My new friend at school") : Text("")) {
                    ForEach(friendVM.newFriends) {
                        Text($0.name)
                    }
                    .onMove(perform: friendVM.moveFriend)
                    .onDelete(perform: friendVM.deletFriend)
                }
            }
            .sheet(isPresented: $friendVM.showingAddFriend) {
                AddFriendFormView(vm: friendVM)
            }
            .navigationTitle("My friends")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        friendVM.showingAddFriend = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView(friendVM: FriendViewModel())
    }
}