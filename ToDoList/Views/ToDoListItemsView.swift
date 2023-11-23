//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//

import SwiftUI

struct ToDoListItemsView: View {
    @StateObject var viewModel = ToDoListItemsViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text(item.title)
                    .bold()
                    .font(.title)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item:item)
            }label:{
                Image(systemName:item.isDone ? "checkmark.circle.fill" : "circle")
            }.foregroundStyle(.blue)
            
        }
    }
}

#Preview {
    ToDoListItemsView(item: .init(id:"123",
                                  title:"Get milk",
                                  dueDate: Date().timeIntervalSince1970,
                                 createDate: Date().timeIntervalSince1970,
                                 isDone: false))
}
