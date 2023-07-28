//
//  ItemModel.swift
//  TODO
//
//  Created by Carlos Amaral on 25/07/23.
//

import Foundation

struct CreateItemModel {
    var id : String
    var title: String
    var description: String
    var status: StatusEnum
    var date: Date
}

struct ItemModel: Identifiable, Decodable {
    let id : String
    let title: String
    let description: String
    var status: String
    let date: Date
    let createdAt: Date
}
