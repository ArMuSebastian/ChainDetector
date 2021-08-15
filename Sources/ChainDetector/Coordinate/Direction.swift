//
//  Direction.swift
//  
//
//  Created by Artem Myshkin on 03.08.2021.
//

import Foundation

extension Axis {

    enum Direction: CaseIterable {

        case none
        case left
        case right
        case up
        case down

        var delta: Step {
            switch self {
            case .left:
                return .init(horisontal: -1, vertical: 0)
            case .right:
                return .init(horisontal: 1, vertical: 0)
            case .up:
                return .init(horisontal: 0, vertical: 1)
            case .down:
                return .init(horisontal: 0, vertical: -1)
            default:
                return .init(horisontal: 0, vertical: 0)
            }
        }

    }

}
