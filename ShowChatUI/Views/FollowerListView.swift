//
//  FollowerListView.swift
//  ShowChatUI
//
//  Created by Dheeraj Nandigama on 3/31/24.
//

import SwiftUI

struct FollowerListView: View {
    var body: some View {
            VStack{
                Text("MY FOLLOWERS")
                    .font(.system(size: 19, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                
                // Search Bar View Model
                
                SearchBarViewModel()
                
                // Room View
                
                RoomView()
                
                // Individual Follower View
                
                IndividualFollowerView()
            }
    }
}

#Preview {
    FollowerListView()
}
