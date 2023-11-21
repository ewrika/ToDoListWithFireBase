//
//  ContentView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 07.11.2023.
//

import SwiftUI
import FirebaseCore

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //signed in
            accountView
        }else{
            
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView:some View{
        TabView{
            ToDoListView(userId:viewModel.currentUserId)
                .tabItem {
                    Label("Home",systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile",systemImage: "person.circle")
                }
        }
    }
    
}




#Preview {
    MainView()
}
