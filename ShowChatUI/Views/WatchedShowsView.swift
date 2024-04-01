//
//  WatchedShowsView.swift
//  ShowChatUI
//
//  Created by Dheeraj Nandigama on 3/31/24.
//


import SwiftUI

struct WatchedShowsView: View {
    var body: some View {
        HStack{
            
            //List of all shows
            ForEach(showList, id: \.id) { item in
                ScrollView(.horizontal, showsIndicators: false){
                        Image(item.img)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    WatchedShowsView()
}
