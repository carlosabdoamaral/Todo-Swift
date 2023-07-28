//
//  ContentView.swift
//  TODO
//
//  Created by Carlos Amaral on 25/07/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
    @ObservedObject var env: Env
    @FirestoreQuery(collectionPath: "todos", predicates: []) var todos: [ItemModel]
    
    var body: some View {
        NavigationView {
            VStack {
                List(todos) { item in
                    if resolveStatusByString(s: item.status) == .todo {
                        Section(header: Text(resolveStatusText(s:.todo))) {
                            TodoItemRow(item: item, env: env)
                        }
                    }
                    
                    else if resolveStatusByString(s: item.status) == .in_progress {
                        Section(header: Text(resolveStatusText(s:.in_progress))) {
                            TodoItemRow(item: item, env: env)
                        }
                    }
                    
                    else if resolveStatusByString(s: item.status) == .done {
                        Section(header: Text(resolveStatusText(s:.done))) {
                            TodoItemRow(item: item, env: env)
                        }
                    }
                    
                    else if resolveStatusByString(s: item.status) == .canceled {
                        Section(header: Text(resolveStatusText(s:.canceled))) {
                            TodoItemRow(item: item, env: env)
                        }
                    }
                }
            }
            .sheet(isPresented: $env.isShowingCreateItemModal) {
                CreateItemView(env: env)
            }
            .navigationTitle("TODO")
            .toolbar {
                NavigationLink(destination: CreateItemView(env: self.env)) {
                    Image(systemName: "plus")
                }
            }
            .onAppear {
                self.env.items = self.todos
            }
        }
    }
}

struct TodoItemRow : View {
    var item : ItemModel
    var env : Env
    
    var body: some View {
        NavigationLink(destination: ItemDetailsView(env: self.env, item: item)) {
            HStack {
                ZStack {}
                    .frame(width: 5, height: 60)
                    .background(resolveStatusColor(s: resolveStatusByString(s: item.status)))
                    .cornerRadius(100)
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    
                        Text(item.description)
                            .font(.subheadline)
                            .lineLimit(2)
                    }
                    
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(env: Env())
    }
}
