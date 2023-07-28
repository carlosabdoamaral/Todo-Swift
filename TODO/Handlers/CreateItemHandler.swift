//
//  CreateItemHandler.swift
//  TODO
//
//  Created by Carlos Amaral on 25/07/23.
//

import Foundation
import SwiftUI

import FirebaseFirestore
import FirebaseFirestoreSwift

//MARK: Returns the status ok or not for item creation
func CreateItemHandler(env: Env, item : CreateItemModel) -> Bool {
    var itemToSave = item
    if itemToSave.title == "" {
        return false
    }
    
    if itemToSave.description == "" {
        itemToSave.description = "Não informado"
    }
    
    let docData : [String:Any] = [
        "id": itemToSave.id,
        "title" : itemToSave.title,
        "description" : itemToSave.description,
        "status": resolveStatusText(s: itemToSave.status),
        "date": Timestamp(date: itemToSave.date),
        "createdAt": Timestamp(date: Date.now)
    ]
    
    let docRef = Firestore.firestore().collection("todos").document(item.title)
    docRef.setData(docData) { error in
        if let error = error {
            print("Error writing document: \(error)")
        } else {
            print("Document successfully written!")
        }
    }

    return true
}

//MARK: Returns the status ok or not for item creation
func UpdateItemHandler(env: Env, item : ItemModel) -> Bool {
    let docData : [String:Any] = [
        "id": item.id,
        "title" : item.title,
        "description" : item.description,
        "status": item.status,
        "date": Timestamp(date: item.date),
        "createdAt": Timestamp(date: Date.now)
    ]
    
    let docRef = Firestore.firestore().collection("todos").document(item.title)
    docRef.setData(docData) { error in
        if let error = error {
            print("Error writing document: \(error)")
        } else {
            print("Document successfully written!")
        }
    }

    return true
}
