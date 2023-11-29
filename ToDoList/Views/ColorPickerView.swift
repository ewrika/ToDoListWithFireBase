//
//  ColorPickerView.swift
//  ToDoList
//
//  Created by Георгий Борисов on 29.11.2023.
//

import SwiftUI

struct ColorPickerView: View {
    var colors:[Color]=[.red,.yellow,.orange,.purple,.blue,.mint]
    @Binding var selectedColor : Color

    var body: some View {
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
    }
    var pickedCircle:some View{
        Circle()
            .frame(width: 300, height: 300)
    }
}



#Preview {
    ColorPickerView(selectedColor: .constant(.blue))
}
