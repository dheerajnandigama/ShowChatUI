//
//  ProfileHeaderView.swift
//  ShowChatUI
//
//  Created by Dheeraj Nandigama on 3/31/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        HStack{
            Image("mainuser")
            VStack{
                HStack{
                    Text("ShowchatCat")
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    // Edit Icon
                    Button {
                    } label: {
                        Image(.iconEdit)
                          .padding(8)
                          .background(.bc1)
                          .foregroundColor(.white)
                          .clipShape(Circle())

                        }
                    
                    // Settings Icon
                    Button {
                    } label: {
                        Image(.union)
                          .padding(18)
                          .background(.bc1)
                          .foregroundColor(.white)
                          .clipShape(Circle())

                        }
                     }
                HStack{
                    VStack{
                        Text("1323")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Showchats")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.gray)
                    }
                    .padding(5)
                    VStack{
                        Text("113")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.gray)
                    }
                    .padding(5)
                    VStack{
                        Text("59")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Following")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.gray)
                    }
                    .padding(5)
                }
            }
        }
    }
}

#Preview {
    ProfileHeaderView()
}
