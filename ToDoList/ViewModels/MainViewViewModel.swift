//
//  MainViewViewModel.swift
//  ToDoList
// when user signs in or out this published will be triggered and update oru view

// if we have a user it means they are signed in
// nil = not signed in
//

import FirebaseAuth
import Foundation
    
class MainViewViewModel : ObservableObject{
    @Published var currentUserId:String = ""
    //private var handler = AuthStateDidChangeListenerHandle?
    
    init(){
        let handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async {
            self?.currentUserId = user?.uid ?? ""

            }
            
        }
    }
    
    public var isSignedIn:Bool{
        return Auth.auth().currentUser != nil
    }
}

