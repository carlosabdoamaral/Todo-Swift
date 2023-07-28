//
//  Status.swift
//  TODO
//
//  Created by Carlos Amaral on 25/07/23.
//

import Foundation
import SwiftUI

func resolveStatusColor(s: StatusEnum) -> Color {
    var res = Color.secondary

    switch s {
    case .todo:
        res = Color.secondary
    case .in_progress:
        res = Color.accentColor
    case .done:
        res = Color.green
    case .canceled:
        res = Color.red
    }

    return res
}

let todoStr = "Fazer"
let inProgressStr = "Fazendo"
let doneStr = "Feito"
let canceledStr = "Cancelado"

func resolveStatusText(s: StatusEnum) -> String {
    var res = ""

    switch s {
        case .todo:
            res = todoStr
        case .in_progress:
            res = inProgressStr
        case .done:
            res = doneStr
        case .canceled:
            res = canceledStr
    }

    return res
}

func resolveStatusByString(s: String) -> StatusEnum {
    var res = StatusEnum.todo

    switch s {
        case todoStr:
            res = .todo
        case inProgressStr:
            res = .in_progress
        case doneStr:
            res = .done
        case canceledStr:
            res = .canceled
        default:
            res = .todo
    }

    return res
}
