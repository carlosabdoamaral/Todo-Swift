//
//  DefaultTextFieldWidget.swift
//  TODO
//
//  Created by Carlos Amaral on 22/07/23.
//

import SwiftUI

struct DefaultTextFieldWidget: View {
    var placeholder: String
    var value: Binding<String>
    
    private let radius = CGFloat(10)
    private let inputBackground = Color.secondary.opacity(0.1)
    
    var body: some View {
        TextField(placeholder, text: value, axis: .vertical)
            .padding()
            .background(inputBackground)
            .cornerRadius(radius)
            .padding(.bottom, 5)
            .lineLimit(4)
    }
}
