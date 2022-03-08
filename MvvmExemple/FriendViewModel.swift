//
//  FriendViewModel.swift
//  MvvmExemple
//
//  Created by Elliot Knight on 05/03/2022.
//

import Foundation
import SwiftUI


class FriendViewModel: ObservableObject {
    @Published var newFriends = [Friend]()
    @Published var friendName = ""
    @Published var showingSheetAddFriend = false
    @Published var friends: [Friend] = [
        Friend(name: "Tony Thomas", isLiked: false),
        Friend(name: "Axel LB", isLiked: false),
        Friend(name: "Mickael Mas", isLiked: true),
        Friend(name: "Britney", isLiked: false),
        Friend(name: "Léna Hachem", isLiked: true),
        Friend(name: "John L.", isLiked: false),
        Friend(name: "Jax Minou", isLiked: true),
        Friend(name: "Lucas Abil", isLiked: false)
    ]
    @Published var searchFriend: String = ""
    @Published var showAlert = false
    
    // Delet friends
    func deletFriend(at offsets: IndexSet) {
        friends.remove(atOffsets: offsets)
    }
    // Move friends
    func moveFriend(from offsets: IndexSet, to destination: Int) {
        friends.move(fromOffsets: offsets, toOffset: destination)
    }
    
    func addFriend() {
        if friendName.count >= 3 {
            showAlert = true
        } else {
            return
        }
        let friend = Friend(name: friendName, isLiked: false)
        newFriends.append(friend)
        
    }
    func deletNewFriend(at offsets: IndexSet) {
        newFriends.remove(atOffsets: offsets)
    }
    
    func moveNewFriend(from offsets: IndexSet, to destination: Int) {
        newFriends.move(fromOffsets: offsets, toOffset: destination)
    }
}

