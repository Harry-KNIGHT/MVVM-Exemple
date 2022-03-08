//
//  FriendDetailView.swift
//  MvvmExemple
//
//  Created by Elliot Knight on 08/03/2022.
//

import SwiftUI

struct FriendDetailView: View {
    var friend: Friend
    @StateObject var friendViewM = FriendViewModel()
    var body: some View {
        HStack {
        Text(friend.name)
            Button(action: {
              // Add friend to favorites
//                friend.isLiked.toggle()
             }, label: {
                Image(systemName: friend.isLiked ? "star.fill" : "star")
                    .foregroundColor(.blue)
            })
        }
        .font(.title)
        .padding(20)
        .background(.regularMaterial)
        .cornerRadius(10)
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: Friend(name: "Elliot", isLiked: false))
    }
}
