//
//  File.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

import struct MathKit.Index
import enum MathKit.Axis

extension MathKit.Index {

    static
    internal func + (index: MathKit.Index, step: Axis.Direction.Step) -> MathKit.Index {
        
        return MathKit.Index(row: index.row + step.vertical,
                             column: index.column + step.horisontal)
    }

    static
    internal func + (step: Axis.Direction.Step, index: MathKit.Index) -> MathKit.Index {
        return index + step
    }

}
