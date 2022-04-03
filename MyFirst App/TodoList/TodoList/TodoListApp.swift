//
//  TodoListApp.swift
//  TodoList
//
//  Created by Abdulwahab Alqallaf on 28/03/2022.
//

import SwiftUI

/*
 MVVM Architcture
 
 Midel - data point
 View - UI
 ViewModel - manages Models for View
  
 */

@main
struct TodoListApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
            
        }
    }
}
