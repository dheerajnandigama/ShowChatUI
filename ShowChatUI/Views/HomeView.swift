//
//  HomeView.swift
//  ShowChatUI
//
//  Created by Dheeraj Nandigama on 3/31/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    // Profile Header View
                    
                    ProfileHeaderView()
                    
                    // Follower List View
                    
                    FollowerListView()
                }
                .padding(5)
            }
            
            VStack {
                Spacer()
                
                // Floating Button to create a room
                
                Button(action: {
                    
                }) {
                    Text("Create a room")
                        .font(.system(size: 16, weight: .medium))
                        .padding(.horizontal, 120)
                        .padding(.vertical, 30)
                        .background(LinearGradient(gradient: Gradient(colors: [.g1, .g2, .g3]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        .foregroundColor(.bc1)
                        .cornerRadius(30)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}





#Preview {
    HomeView()
}
