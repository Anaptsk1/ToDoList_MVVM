//
//  AnimationView.swift
//  ToDoListApp-MVVM
//
//  Created by Ana Ptskialadze on 22.01.25.
//

import SwiftUI

struct NoItemsView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                NavigationLink {
                    AddItemView()
                } label: {
                    Text("Add Something 🥳")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(animate ? Color.red : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .offset(y: animate ? -7 : 0)
                .scaleEffect(animate ? 1.1 : 1.0)
                .shadow(
                    color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    y: animate ? 40 : 30)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear {
                animateTheButton()
            }
        }
    }
    func animateTheButton() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
}
