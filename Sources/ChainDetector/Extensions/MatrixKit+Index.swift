//
//  MatrixKit+Index.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

extension CDIndex {

    static
    public func + (index: CDIndex, step: CDAxis.Direction.Step) -> CDIndex {
        
        return CDIndex(row: index.row + step.vertical,
                       column: index.column + step.horisontal)
    }

    static
    public func + (step: CDAxis.Direction.Step, index: CDIndex) -> CDIndex {
        return index + step
    }

}
