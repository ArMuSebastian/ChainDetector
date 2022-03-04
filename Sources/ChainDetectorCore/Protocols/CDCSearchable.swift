//
//  CDSearchable.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

import struct MathKit.Index
import struct MathKit.Size
import struct MathKit.Matrix

public protocol CDCSearchable
where Content.Element == Self.Element, Content.Tile == Self.Tile {

    associatedtype Element
    associatedtype Tile
    associatedtype Content: CDCCellContainer

    var size: Size { get }

    subscript(_ index: Index) -> Content { get }

}
