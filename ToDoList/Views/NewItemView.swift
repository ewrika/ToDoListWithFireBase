//
//  NewItemView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    @Binding var selectedColor : Color
    var colors:[Color]=[.red,.yellow,.orange,.purple,.blue,.mint]
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,100)

            
            
            
            Form{
                //title
                TextField("Name",text:$viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Date
                DatePicker("Due Date",selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Color
                ScrollView(.horizontal){
                    HStack{
                        ForEach(colors,id:\.self){color in
                            Circle()
                                .foregroundStyle(color)
                                .frame(width: 45, height: 45)
                                .opacity(color==selectedColor ? 0.5:1.0)
                                .scaleEffect(color == selectedColor ? 1.1:1.0)
                                .onTapGesture {
                                    selectedColor = color
                                }
                        }
                    }
                    .padding()
                }
                //Button
                TLButton(title: "Save", background: selectedColor){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                }
            }.alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"),message: Text("Неправильная дата или название"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get:{
        return true
    }, set: {_ in
    }
                                         ), selectedColor: .constant(.red))
}
