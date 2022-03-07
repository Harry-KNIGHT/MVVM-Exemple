//
//  AddFriendFormView.swift
//  MvvmExemple
//
//  Created by Elliot Knight on 05/03/2022.
//

import SwiftUI

struct AddFriendFormView: View {
    @ObservedObject var friendViewModel: FriendViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("Add new friend ! 😜")) {
                TextField("Friend name", text: $friendViewModel.friendName)
                if friendViewModel.friendName.count > 3 {
                    Button("Save") {
                        let friend = Friend(name: friendViewModel.friendName)
                        friendViewModel.newFriends.append(friend)
                        self.presentationMode.wrappedValue.dismiss()
                        friendViewModel.friendName = ""
                    }
                }
            }
        }
    }
}

struct AddFriendFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendFormView(friendViewModel: FriendViewModel())
        
    }
}
