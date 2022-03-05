//
//  CDSearchable.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

public protocol CDCSearchable {

    associatedtype Key: CDCKey
    associatedtype Content: CDCCellContainer

    typealias Element = Content.Element
    typealias Tile = Content.Tile

    func contains(_ key: Key) -> Bool
    subscript(_ index: Key) -> Content { get }

}
