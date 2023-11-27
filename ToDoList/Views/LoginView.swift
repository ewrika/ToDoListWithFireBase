//
//  LoginView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//

import SwiftUI

struct LoginView: View {
@StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                //Header
                
                HeaderView(title: "To Do List", subtitile: "Get Things done", angle: 15, background: .clear)
                

                
                //Login
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("Email Adress",text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .ignoresSafeArea(.keyboard)

                    SecureField("Password ",text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .ignoresSafeArea(.keyboard)
                    TLButton(title: "Log in", background: .blue) {
                        viewModel.login()
                    }
                    
                }.scrollContentBackground(.hidden)
                .ignoresSafeArea(.keyboard)
                .offset(y:-50)
                
                //Regist
                
                VStack{
                    Text("New account here?")
                        .font(.system(size:16,weight: .bold,design: .monospaced))
                        .padding()
                    NavigationLink("Create an Account",destination:RegisterView())
                        .font(.system(size:20,weight: .bold,design: .monospaced))
                }.padding(.bottom,50)
                
                Spacer()
            }.ignoresSafeArea(.keyboard)
                .background(.pink.gradient)

        }.ignoresSafeArea(.keyboard)
    }
}

#Preview {
    LoginView()
}
