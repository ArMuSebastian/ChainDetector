//
//  Check.swift
//  
//
//  Created by Artem Myshkin on 03.08.2021.
//

import Foundation

extension ChekingMask {

    internal enum Check {

        case vertical
        case horisontal
        case all

        static
        internal func + (lhs: Check, rhs: Check) -> Check {
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
