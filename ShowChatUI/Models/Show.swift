//
//  Show.swift
//  ShowChatUI
//
//  Created by Dheeraj Nandigama on 3/31/24.
//

import SwiftUI

struct ShowModel: Identifiable{
    var id: UUID = .init()
    var img : String
}

var showList: [ShowModel] = [
    ShowModel(img:"show1"),
    ShowModel(img:"show2"),
    ShowModel(img:"show3"),
    ShowModel(img:"show4"),
    ShowModel(img:"show5")
]
