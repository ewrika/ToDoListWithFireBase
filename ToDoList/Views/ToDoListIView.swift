//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items:[ToDoListItem]
    private let userId:String
    
    init(userId:String){
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                List(items){ item in
                    ToDoListItemsView(item:item)
                        .swipeActions{
                            Button(role: .destructive){
                                viewModel.delete(id:item.id)
                            }
                        label:{
                                Text("Delete")
                            }
                        }
                }.listStyle(PlainListStyle())
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
    ToDoListView(userId: "cNZGL6ob22MeGJTSwKj64t4DSCk1")
}
