//
//  ProfileView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                
            }.navigationTitle("Profile")
        }
    }}


#Preview {
    ProfileView()
}
