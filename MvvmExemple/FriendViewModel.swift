//
//  FriendViewModel.swift
//  MvvmExemple
//
//  Created by Elliot Knight on 05/03/2022.
//

import Foundation


class FriendViewModel: ObservableObject {
    @Published var newFriends = [Friend]()
    @Published var friendName = ""
    @Published var showingSheetAddFriend = false
    @Published var friends = ["Tony", "Axel", "Micka", "Britney", "Léna", "John", "Lucas", "Jax"]
    @Published var searchFriend: String = ""
    // Delet friends
    func deletFriend(at offsets: IndexSet) {
        friends.remove(atOffsets: offsets)
    }
    // Move friends
    func moveFriend(from offsets: IndexSet, to destination: Int) {
        friends.move(fromOffsets: offsets, toOffset: destination)
    }
    
    
    func deletNewFriend(at offsets: IndexSet) {
        newFriends.remove(atOffsets: offsets)
    }
    
    func moveNewFriend(from offsets: IndexSet, to destination: Int) {
        newFriends.move(fromOffsets: offsets, toOffset: destination)
    }
    
    var searchFriendsResult: [String] {
        if searchFriend.isEmpty {
            return friends
        }else {
            return friends.filter { $0.contains(searchFriend)}
        }
    }
}

