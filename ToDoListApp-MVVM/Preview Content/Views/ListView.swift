//
//  ContentView.swift
//  ToDoListApp-MVVM
//
//  Created by Ana Ptskialadze on 09.11.24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if listViewModel.items.isEmpty {
                    Text("No Items")
                        .font(.title)
                } else {
                    List {
                        ForEach(listViewModel.items, content: { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        })
                        .onDelete(perform: listViewModel.deleteItem(indexSet:))
                        .onMove(perform: listViewModel.moveItem(indexSet:to:))
                    }
                    .listStyle(.grouped)
                    .font(.headline)
                }
            }
            .navigationTitle("ToDoList 📝")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add") {
                        AddItemView()
                    }
                }
            }
        }
    }
}
#Preview {
    ListView()
        .environmentObject(ListViewModel())
}
