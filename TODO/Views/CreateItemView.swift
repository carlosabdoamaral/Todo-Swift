//
//  CreateItemView.swift
//  TODO
//
//  Created by Carlos Amaral on 25/07/23.
//

import SwiftUI


struct CreateItemView: View {
    @ObservedObject var env: Env
    
    @State var title : String = ""
    @State var description: String = ""
    @State var status: StatusEnum = .todo
    @State var date: Date = Date.now
    
    let statusOptions : [StatusEnum] = [
        .todo,
        .in_progress,
        .done,
        .canceled
    ]
    
    func clear() {
        self.title = ""
        self.description = ""
        self.status = .todo
        self.date = Date.now
    }
    
    var body: some View {
        VStack {
            DefaultTextFieldWidget(placeholder: "Título", value: $title)
            DefaultTextFieldWidget(placeholder: "Descrição", value: $description)
            Picker("Status", selection: $status) {
                ForEach(statusOptions, id: \.self) { s in
                    Text(resolveStatusText(s: s))
                }
            }
            .pickerStyle(.navigationLink)
            .padding()
            .background(inputBackground)
            .cornerRadius(radius)
            .padding(.bottom, 5)
            .lineLimit(4)
            
            DatePicker("Data", selection: $date)
                .datePickerStyle(.compact)
                .padding()
                .background(inputBackground)
                .cornerRadius(radius)
                .padding(.bottom, 5)
                .lineLimit(4)
            
            Spacer()
            DefaultPrimaryButtonWidget(content: "Salvar!") {
                let item = CreateItemModel(
                    id: self.title, title: self.title,
                    description: self.description,
                    status: self.status,
                    date: self.date
                )
                
                
                let success = CreateItemHandler(env: env, item: item)
                if success == false {
                    print("Error")
                } else {
                    self.env.isShowingCreateItemModal = false
                }
            }
        }
        .padding()
        .navigationTitle("Criar item")
    }
}

struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreateItemView(env: Env())
    }
}
