//
//  ToDoListItemsViewModel.swift
//  ToDoList
//
//  Created by Георгий Борисов on 19.11.2023.
//
import Firebase
import FirebaseFirestore
import Foundation

class ToDoListItemsViewViewModel:ObservableObject{
    init(){}
    
    func toggleIsDone(item:ToDoListItem){
        var itemCopy =  item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        
        let db  = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }


}
