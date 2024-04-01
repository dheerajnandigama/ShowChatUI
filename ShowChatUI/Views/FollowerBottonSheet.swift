//
//  FollowerBottonSheet.swift
//  ShowChatUI
//
//  Created by Dheeraj Nandigama on 3/31/24.
//

import SwiftUI

struct FollowerBottonSheet: View {
    var onDelete: () -> Void
    var onDismiss: () -> Void
    let messageLines = [
            "Once you remove a follower, they",
            "will need to request to follow again."
        ]

    var body: some View {
        VStack {
            Text("Are you sure?")
                .font(.system(size: 32, weight: .semibold))
                .padding()
            
            ForEach(messageLines, id: \.self) { line in
                            Text(line)
                                .font(.system(size: 16, weight: .semibold))
                        }
            
            Button(action: onDelete) {
                Text("Yes, remove")
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 120)
                    .padding(.vertical, 30)
                    .background(LinearGradient(gradient: Gradient(colors: [.g1, .g2, .g3]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .foregroundColor(.bc1)
                    .cornerRadius(30)
            }
            .padding(.horizontal)
            .padding(.bottom)
            .padding(.top)
            
            Button(action: onDismiss) {
                Text("No, go back")
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 120)
                    .padding(.vertical, 30)
                    .background(.bc1)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}



