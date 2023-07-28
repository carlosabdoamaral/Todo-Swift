//
//  TODOApp.swift
//  TODO
//
//  Created by Carlos Amaral on 25/07/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class Env: ObservableObject {
    @Published var isShowingCreateItemModal : Bool = false
    @Published var isShowingItemDetailsModal : Bool = false
    @Published var db : Firestore = Firestore.firestore()
    @Published var items : [ItemModel] = []
}

@main
struct TODOApp: App {
    @StateObject var env = Env()
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(env: env)
        }
    }
}
