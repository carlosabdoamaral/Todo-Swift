//
//  ItemMock.swift
//  TODO
//
//  Created by Carlos Amaral on 25/07/23.
//

import Foundation

let mockItem = ItemModel(
    id: "FAZER_CAFE",
    title: "Fazer café",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    status: resolveStatusText(s: .in_progress),
    date: Date.now,
    createdAt: Date.now
)

let emptyItem = ItemModel(
    id: "",
    title: "",
    description: "",
    status: resolveStatusText(s: .todo),
    date: Date.now,
    createdAt: Date.now
)
