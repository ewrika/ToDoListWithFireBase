//
//  RegisterView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//

import SwiftUI

struct RegisterView: View {
@StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitile: "Start organizing todo", angle: -15, background: .orange)
            
            Form{
                TextField("FullName",text:$viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email",text:$viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                SecureField("Password",text:$viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Registration", background: .red) {
                    viewModel.register()
                }
                
            }
            .offset(y:-50)
            
            Spacer()
            
        }
    }
}

#Preview {
    RegisterView()
}
