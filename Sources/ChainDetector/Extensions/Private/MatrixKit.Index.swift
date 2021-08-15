//
//  File.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

import struct MatrixKit.Index

extension MatrixKit.Index {

    static
    internal func + (index: MatrixKit.Index, step: Axis.Direction.Step) -> MatrixKit.Index {
        return MatrixKit.Index(row: index.row + step.vertical,
                               column: index.column + step.horisontal)
    }

    static
    internal func + (step: Axis.Direction.Step, index: MatrixKit.Index) -> MatrixKit.Index {
        return index + step
    }

}
