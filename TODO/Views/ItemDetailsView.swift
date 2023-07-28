//
//  ItemDetailsView.swift
//  TODO
//
//  Created by Carlos Amaral on 25/07/23.
//

import SwiftUI

struct ItemDetailsView: View {
    @ObservedObject var env: Env
    var item : ItemModel
    
    func dateToString(d : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
         
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        
        return dateFormatter.string(from: d)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.status)
                .font(.headline)
                .foregroundColor(
                    resolveStatusColor(
                        s: resolveStatusByString(
                            s: item.status
                        )
                    )
                )
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(resolveStatusColor(s: resolveStatusByString(s: item.status)).opacity(0.1)
                )
                .cornerRadius(100)
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Data")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(dateToString(d: self.item.date))
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Descrição")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(self.item.description)
                    
                }
                
                Spacer()
                
                NavigationLink(destination: UpdateItemStatusView(env: env, item: item)) {
                    
                    HStack {
                        Spacer()
                        Text("Atualizar status")
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(radius)
                    .padding(.bottom, 5)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(self.item.title)
        
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailsView(
            env: Env(),
            item: mockItem
        )
    }
}
