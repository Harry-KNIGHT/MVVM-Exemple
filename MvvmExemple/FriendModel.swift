//
//  FriendModel.swift
//  MvvmExemple
//
//  Created by Elliot Knight on 06/03/2022.
//

import Foundation

struct Friend: Identifiable {
    var id = UUID()
    var name: String
    var isLiked: Bool
}
