//
//  AddFriendFormView.swift
//  MvvmExemple
//
//  Created by Elliot Knight on 05/03/2022.
//

import SwiftUI

struct AddFriendFormView: View {
    @ObservedObject var vm: FriendViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            TextField("Friend name", text: $vm.friendName)
            if !vm.newFriends.isEmpty {
                Button("Save") {
                    let friend = Friend(name: vm.friendName)
                    vm.newFriends.append(friend)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct AddFriendFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendFormView(vm: FriendViewModel())
        
    }
}
