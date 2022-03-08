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
            VStack {
                List {
                    if !friendVM.friends.isEmpty {
                        Section(header: Text("Best Ones")) {
                            ForEach(friendVM.friends) { friend in
                                NavigationLink(destination: FriendDetailView(friend: friend)) {
                                    Text(friend.name)
                                    Spacer()
                                }
                            }
                            .onDelete(perform: friendVM.deletFriend)
                            .onMove(perform: friendVM.moveFriend)
                        }
                    }
                    if friendVM.newFriends.count >= 1 {
                        Section(header: friendVM.newFriends.count > 1 ?  Text("My new friends") : Text("My new friend")) {
                            ForEach(friendVM.newFriends) {
                                Text($0.name)
                            }
                            .onMove(perform: friendVM.moveNewFriend)
                            .onDelete(perform: friendVM.deletNewFriend)
                        }
                    }
                }
                .sheet(isPresented: $friendVM.showingSheetAddFriend) {
                    AddFriendFormView(friendViewModel: friendVM)
                }
                .navigationTitle("My friends")
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            friendVM.showingSheetAddFriend = true
                            friendVM.friendName = ""
                        } label: {
                            Image(systemName: "plus")
                                .font(.title3)
                        }
                    }
                }
            }
            .searchable(text: $friendVM.searchFriend)
            
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView(friendVM: FriendViewModel())
    }
}
