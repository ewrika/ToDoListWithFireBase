//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewViewModel()
    private let userId:String
    
    init(userId:String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                
            }.navigationTitle("To Do List")
                .toolbar{
                    Button{
                        //Action
                        
                        viewModel.showingNewItemView=true
                    }label: {
                        Image(systemName: "plus")
                    }
                }.sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
        }
    }
}

#Preview {  
    ToDoListView(userId: "")
}
