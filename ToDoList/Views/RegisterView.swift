//
//  RegisterView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitile: "Start organizing todo", angle: -15, background: .orange)
            
            Form{
                TextField("FullName",text:$name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email",text:$email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                SecureField("Password",text:$password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Registration", background: .red) {
                    //
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
