//
//  UpdateItemStatusView.swift
//  TODO
//
//  Created by Carlos Amaral on 25/07/23.
//

import Foundation
import SwiftUI

import FirebaseFirestore
import FirebaseFirestoreSwift

struct UpdateItemStatusView: View {
    @State var status: StatusEnum = .todo
    @State var pickerDisabled : Bool = false
    
    @ObservedObject var env : Env
    var item : ItemModel
    
    let statusOptions : [StatusEnum] = [
        .todo,
        .in_progress,
        .done,
        .canceled
    ]

    var body: some View {
        List {
            Picker("Novo status", selection: $status) {
                ForEach(statusOptions, id: \.self) { s in
                    Text(resolveStatusText(s: s))
                }
            }
            .disabled(self.pickerDisabled)
            .pickerStyle(.inline)
        }
        .onChange(of: self.status) { newValue in
            let succeed = UpdateItemHandler(
                env: env,
                item: ItemModel(
                    id: item.title,
                    title: item.title,
                    description: item.description,
                    status: resolveStatusText(s: status),
                    date: item.date,
                    createdAt: item.createdAt
                )
            )
            
            if succeed == false {
                print("Erro!")
                return
            }
        }
        .onAppear {
            self.status = resolveStatusByString(s: self.item.status)
        }
        .navigationTitle("Atualizar status")
    }
}

struct UpdateItemStatusView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateItemStatusView(
            env: Env(),
            item: mockItem
        )
    }
}
