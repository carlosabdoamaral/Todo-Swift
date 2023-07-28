//
//  DefaultPhotoPickerWidget.swift
//  TODO
//
//  Created by Carlos Amaral on 22/07/23.
//

import SwiftUI
import PhotosUI

struct DefaultPhotoPickerWidget: View {
    let placeholder : String
    var item : Binding<PhotosPickerItem?>
    var image : Binding<Image?>
    
    var body: some View {
        HStack {
            PhotosPicker(self.placeholder, selection: self.item, matching: .images)
            Spacer()
        }
        .padding()
        .background(inputBackground)
        .cornerRadius(radius)
        .padding(.vertical, 5)
    }
}
