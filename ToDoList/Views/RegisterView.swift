//
//  RegisterView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//

import SwiftUI

struct RegisterView: View {
@StateObject var viewModel = RegisterViewViewModel()
@StateObject var viewModels = NewItemViewViewModel()
@State private var showingAlert = false


    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitile: "Start organizing todo", angle: -15, background: .clear)
            VStack{
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("FullName",text:$viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email",text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                        .keyboardType(.emailAddress)
                    SecureField("Password",text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Registration", background: .red) {
                        //viewModel.register()
                        if viewModel.register() == true {
                            print("ok")
                            showingAlert = true
                        }
                        else {
                            print("pass")
                        }
                    }.alert("Происходит Регистрация", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }}
                    
                }.scrollContentBackground(.hidden)
               
                
                .offset(y:-50)
                Spacer()
                
            }
        }.background(.orange.gradient)
    }
}

#Preview {
    RegisterView()
}
