//
//  Axis.swift
//  
//
//  Created by Artem Myshkin on 03.08.2021.
//

import Foundation

enum Axis {

    case vertical
    case horisontal

    var directions: (first: Direction, second: Direction) {
        switch self {
        case .horisontal:
            return (.left, .right)
        case .vertical:
            return (.down, .up)
        }
    }

}
