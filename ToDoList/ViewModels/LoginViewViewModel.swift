//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//
import Firebase
import Foundation

class LoginViewViewModel:ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        
        guard validate() else{
            return
            
        }
        
        //try to enter
        Auth.auth().signIn(withEmail: email, password: password)
    }
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
             !password.trimmingCharacters(in: .whitespaces).isEmpty else{
           errorMessage = "Please fill all fields"
           
           return false
       }
       
       // @email.ru
       guard email.contains("@") && email.contains(".") else{
           errorMessage = "Please enter valid email"
           return false
       }
       
        return true
    }
}
