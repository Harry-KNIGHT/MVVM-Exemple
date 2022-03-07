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
                Button("Save") {
                    friendViewModel.addFriend()
                }.alert("Ajouter \(friendViewModel.friendName) comme ami ?", isPresented: $friendViewModel.showAlert) {
                    Button("Oui") { self.presentationMode.wrappedValue.dismiss() }
                    Button("Non") { friendViewModel.friendName = "" }
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
