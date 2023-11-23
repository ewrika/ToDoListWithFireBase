//
//  HeaderView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 20.11.2023.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subtitile:String
    let angle:Double
    let background:Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(background)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(size:66,weight: .bold,design: .monospaced))
                Text(subtitile)
                    .font(.system(size:36,weight: .light,design: .monospaced))

            }.padding(.top,80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: 350)
        .offset(y:-150)
    }
}

#Preview {
    HeaderView(title: "titile", subtitile: "subtutule", angle: 15, background: .red)
}
