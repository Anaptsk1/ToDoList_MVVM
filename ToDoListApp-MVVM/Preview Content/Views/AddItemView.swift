//
//  AddItemView.swift
//  ToDoListApp-MVVM
//
//  Created by Ana Ptskialadze on 09.11.24.
//

import SwiftUI

struct AddItemView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var textFieltText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            TextField("Start typing Here...", text: $textFieltText)
                .padding(.vertical, 15)
                .padding(.horizontal, 10)
                .background(Color.secondary.opacity(0.3))
                .font(.headline)
                .padding(.vertical, 20)
                .padding(.horizontal, 20)
            
            Button { saveButtonPressed() } label: {
                Text("Save".uppercased())
                    .font(.title2)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.blue)
                    .cornerRadius(10)
                
            }
            .padding(.horizontal, 15)
            Spacer()
                .navigationTitle("Add New Item  here 🖊️")
                .alert(isPresented: $showAlert) {
                    getAlert()
                }
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieltText)
            presentationMode.wrappedValue.dismiss()
        }
        return
    }
    
    func textIsAppropriate() -> Bool {
        if textFieltText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long! 😰"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

#Preview {
    AddItemView()
        .environmentObject(ListViewModel())
}
