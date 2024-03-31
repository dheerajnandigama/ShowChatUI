//
//  RoomView.swift
//  ShowChatUI
//
//  Created by Dheeraj Nandigama on 3/31/24.
//

import SwiftUI

struct RoomView: View {
    @State private var expandedItems: Set<UUID> = []
    @State private var roomList: [RoomItem] = [
        RoomItem(id: UUID(), name: "Room LAcrew", img: "room1", admin: true),
        RoomItem(id: UUID(), name: "Room NYgirls", img: "room2", admin: false)
    ]
    @State private var isShowingBottomSheet = false
    @State private var selectedItem: RoomItem?

    var body: some View {
        VStack {
            ForEach(roomList, id: \.id) { item in
                if !roomList.isEmpty {
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

                            if item.admin {
                                Button(action: {
                                    selectedItem = item
                                    isShowingBottomSheet.toggle()
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(.t1, lineWidth: 1)
                                            .background(RoundedRectangle(cornerRadius: 40)
                                                .fill(.bc1))
                                            .padding(.vertical, 8)
                                            .padding(.horizontal)

                                        Text("Delete room")
                                            .font(.system(size: 14))
                                            .foregroundColor(.t1)
                                    }
                                }
                            } else {
                                Button(action: {
                                    deleteItem(item)
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(.t1, lineWidth: 1)
                                            .background(RoundedRectangle(cornerRadius: 40)
                                                .fill(.bc1))
                                            .padding(.vertical, 8)
                                            .padding(.horizontal)

                                        Text("Leave room")
                                            .font(.system(size: 14))
                                            .foregroundColor(.t1)
                                    }
                                }
                            }
                        }

                        if expandedItems.contains(item.id) {
                            WatchedShowsView()
                                .padding(5)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingBottomSheet) {
            BottomSheetView(
                onDelete: {
                    if let selectedItem = selectedItem {
                        deleteItem(selectedItem)
                        isShowingBottomSheet = false
                    }
                },
                onDismiss: {
                    isShowingBottomSheet = false
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

    private func deleteItem(_ item: RoomItem) {
        if let index = roomList.firstIndex(where: { $0.id == item.id }) {
            roomList.remove(at: index)
        }
    }
}


