//
//  SearchBarViewModel.swift
//  ShowChatUI
//
//  Created by Dheeraj Nandigama on 3/31/24.
//

import SwiftUI

struct SearchBarViewModel: View {
    @State private var searchText = ""
    private let searchBarColor = Color(.systemGray5)

    var body: some View {
        HStack(spacing: 0) {
            
            // Implementation of  Search bar
            Button(action: {
            }) {
                Image(.search)
                    .foregroundColor(.white)
                    .padding(3)
                    .padding(.horizontal,1)
                    .background(searchBarColor)
            }
            
            TextField("Search", text: $searchText)
                .padding(12)
                .background(searchBarColor)
            
            Button(action: {
                self.searchText = ""
            }) {
                Image(.cross)
                    .foregroundColor(searchBarColor)
                    .padding(11)
                    .background(searchBarColor)
            }
        }
        .padding(.bottom, 5)
    }
}

struct SearchBarViewModel_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarViewModel()
    }
}



