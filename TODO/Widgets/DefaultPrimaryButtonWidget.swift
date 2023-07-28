//
//  DefaultPrimaryButtonWidget.swift
//  TODO
//
//  Created by Carlos Amaral on 22/07/23.
//

import SwiftUI
import Foundation

struct DefaultPrimaryButtonWidget: View {
    var content : String
    var onClick : () -> Void
    
    var body: some View {
        Button {
            self.onClick()
        } label: {
            HStack {
                Spacer()
                Text(self.content)
                Spacer()
            }
        }
        .padding()
        .background(Color.accentColor)
        .foregroundColor(Color.white)
        .cornerRadius(radius)
        .padding(.bottom, 5)
    }
}

struct DefaultPrimaryButtonWidget_Previews: PreviewProvider {
    static var previews: some View {
        DefaultPrimaryButtonWidget(
            content: "Content") {
                print("Clicked!")
            }
    }
}
