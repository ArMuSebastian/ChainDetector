//
//  Check.swift
//  
//
//  Created by Artem Myshkin on 03.08.2021.
//

import Foundation

extension ChainDetector.ChekingMask {

    enum Check {

        case vertical
        case horisontal
        case all

        static func + (lhs: Check, rhs: Check) -> Check {
            if (lhs == .all || rhs == .all) {
                return .all
            }

            if lhs == rhs  {
                return lhs
            } else {
                return .all
            }
        }
    }

}
