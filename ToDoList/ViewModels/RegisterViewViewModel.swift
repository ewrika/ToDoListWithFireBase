//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//
import FirebaseFirestore
import Firebase
import Foundation

class RegisterViewViewModel:ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){}
    
    
    func register ()->Bool{
        guard validate() else
        {return false}
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result,error in
            guard let userId = result?.user.uid else {
                return
            }
            
        self?.insertUserRecord(id: userId)
            
            
        }
    return true
    }
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    
    private func validate()->Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        guard password.count >= 6 else{
            errorMessage = "Пароль должен быть больше 6 цифр"
            return false
        }
        
        
        return true
    }
    
}
