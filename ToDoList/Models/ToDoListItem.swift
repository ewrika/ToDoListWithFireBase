//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//

import Foundation

struct ToDoListItem:Codable,Identifiable{
    let id:String
    let title: String
    let dueDate : TimeInterval
    let createDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state 
    }
}
