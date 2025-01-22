//
//  ToDoListApp_MVVMApp.swift
//  ToDoListApp-MVVM
//
//  Created by Ana Ptskialadze on 09.11.24.
//

import SwiftUI

@main
struct ToDoListApp_MVVMApp: App {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some Scene {
        WindowGroup {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
