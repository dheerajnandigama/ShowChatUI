//
//  IndividualFollowerView.swift
//  ShowChatUI
//
//  Created by Dheeraj Nandigama on 3/31/24.
//

import SwiftUI

struct IndividualFollowerView: View {
    @State private var expandedItems: Set<UUID> = []
    @State private var followedItems: Set<UUID> = []
    @State private var followingItems: Set<UUID> = []
    @State private var offset: CGSize = .zero
    @State private var draggingItem: UUID?
    @State private var deleteConfirmation: Bool = false
    @State private var selectedItem: UUID? = nil
    @State private var isShowingBottomSheet: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(userList, id: \.id) { item in
                        VStack {
                            HStack {
                                Image(item.img)
                                    .padding(5)
                                
                                VStack {
                                    Text(item.name)
                                        .font(.system(size: 16, weight: .semibold))
                                    Button(action: {
                                        toggleExpansion(for: item.id)
                                    }) {
                                        Text(expandedItems.contains(item.id) ? "Hide watched shows" : "Show watched shows")
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundStyle(Color.gray)
                                    }
                                }
                                .padding(5)
                                
                                Button {
                                    toggleFollow(for: item.id)
                                } label:{
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(followedItems.contains(item.id) ? Color.t1 : Color.bc2, lineWidth: 1)
                                            .background(RoundedRectangle(cornerRadius: 40)
                                                            .fill(followedItems.contains(item.id) ? Color.bc1 : Color.black))
                                            .padding(.vertical, 8)
                                            .padding(.horizontal)
                                        
                                        Text(followedItems.contains(item.id) ? "Following" : "Follow back")
                                            .font(.system(size: 14))
                                            .foregroundColor(followedItems.contains(item.id) ? Color.t1 : Color.bc2)
                                    }
                                }
                                .disabled(followingItems.contains(item.id))
                                
                                if deleteConfirmation && selectedItem == item.id {
                                    Button(action: {
                                        isShowingBottomSheet = true
                                    }) {
                                        Image("block")
                                            .foregroundColor(.red)
                                    }
                                    .transition(.move(edge: .leading))
                                }
                            }
                            
                            if expandedItems.contains(item.id) {
                                WatchedShowsView()
                                    .padding(5)
                            }
                        }
                        .offset(x: draggingItem == item.id ? offset.width : 0)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if value.translation.width < 0 {
                                        draggingItem = item.id
                                        offset.width = value.translation.width
                                    }
                                }
                                .onEnded { value in
                                    if offset.width < -50 {
                                        deleteConfirmation = true
                                        selectedItem = item.id
                                    }
                                    offset = .zero
                                    draggingItem = nil
                                }
                        )
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingBottomSheet) {
            FollowerBottonSheet(
                onDelete: {
                    if let selectedItem = selectedItem {
                        deleteItem(selectedItem)
                        isShowingBottomSheet = false
                        
                    }
                },
                onDismiss: {
                    isShowingBottomSheet = false
                    deleteConfirmation = false
                }
            )
            .presentationDetents([.height(350)])
        }
    }
    
    private func toggleExpansion(for id: UUID) {
        if expandedItems.contains(id) {
            expandedItems.remove(id)
        } else {
            expandedItems.insert(id)
        }
    }
    
    private func toggleFollow(for id: UUID) {
        if !followedItems.contains(id) {
            followedItems.insert(id)
            followingItems.insert(id)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                followingItems.remove(id)
            }
        }
    }
    
    private func deleteItem(_ id: UUID) {
        if let index = userList.firstIndex(where: { $0.id == id }) {
            userList.remove(at: index)
            
            if selectedItem == id{
                selectedItem = nil
            }
        }
    }
}

struct IndividualFollowerView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualFollowerView()
    }
}

