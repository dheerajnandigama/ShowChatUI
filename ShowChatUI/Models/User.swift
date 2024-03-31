//
//  User.swift
//  ShowChatUI
//
//  Created by Dheeraj Nandigama on 3/31/24.
//

import SwiftUI

struct UserModel: Identifiable, Hashable{
    var id: UUID = .init()
    var img : String
    var name : String
}

var userList: [UserModel] = [
    UserModel(img:"user1", name:"Kathryn Murphy"),
    UserModel(img:"user2", name:"Kristin Watson"),
    UserModel(img:"user3", name:"Lesile Alexander"),
    UserModel(img:"user4", name:"Eleanor Pena"),
    UserModel(img:"user5", name:"Annette Black")
]

