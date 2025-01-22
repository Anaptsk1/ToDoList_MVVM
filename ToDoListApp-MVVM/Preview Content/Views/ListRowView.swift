//
//  ListRowView.swift
//  ToDoListApp-MVVM
//
//  Created by Ana Ptskialadze on 09.11.24.
//

import SwiftUI

struct ListRowView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    let item: ItemModel
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ListView()
        .environmentObject(ListViewModel())
}
