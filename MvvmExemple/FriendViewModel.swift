//
//  FriendViewModel.swift
//  MvvmExemple
//
//  Created by Elliot Knight on 05/03/2022.
//

import Foundation


class FriendViewModel: ObservableObject {
    @Published var friends = ["Tony", "Axel", "Micka", "Britney", "Léna", "John", "Lucas", "Jax"]
    
    // Delet friends
    func deletFriend(at offsets: IndexSet) {
        friends.remove(atOffsets: offsets)
    }
    
    func moveFriend(from offsets: IndexSet, to destination: Int) {
        friends.move(fromOffsets: offsets, toOffset: destination)
    }
}
