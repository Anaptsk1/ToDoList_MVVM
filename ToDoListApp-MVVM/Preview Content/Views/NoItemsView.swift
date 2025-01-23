//
//  AnimationView.swift
//  ToDoListApp-MVVM
//
//  Created by Ana Ptskialadze on 22.01.25.
//

import SwiftUI

struct NoItemsView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    //    private var animation: Animation
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(10)
                NavigationLink {
                    AddItemView()
                } label: {
                    Text("Add Item")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .multilineTextAlignment(.center)
            .padding(40)
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
}
