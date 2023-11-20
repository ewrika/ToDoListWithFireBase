//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Георгий Борисов on 07.11.2023.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
