//
//  CDCSearchable.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

public protocol CDCSearchable {

    associatedtype Key: CDCKey
    associatedtype CellContent: CDCCellContainer

    typealias Element = CellContent.Element
    typealias Tile = CellContent.Tile

    func contains(_ key: Key) -> Bool
    subscript(_ index: Key) -> CellContent { get }

}
