//
//  User.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//

import Foundation

struct User:Codable{
    let id:String
    let name : String
    let email:String
    let joined: TimeInterval
}
