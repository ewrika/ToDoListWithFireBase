//
//  TLButton.swift
//  ToDoList
//
//  Created by Георгий Борисов on 20.11.2023.
//

import SwiftUI

struct TLButton: View {
    let title :String
    let background : Color
    let action :() -> Void
    var body: some View {
        Button{
            //Log in
            action ()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                
                Text("Log In")
                    .foregroundStyle(Color.white)
                    .bold()
            }
        }.padding()
    }
}

#Preview {
    TLButton(title: "Value", background: .pink){
        //
    }
}
