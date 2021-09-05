//
//  Searchable.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

import struct MathKit.Size
import struct MathKit.Matrix

public protocol CDSearchable {

    associatedtype Element: CDSearchableElement
    associatedtype Tile: CDSearchableTile

    var elements: Matrix<Element?> { get }
    var mask: Matrix<Tile> { get }
    var size: Size { get }

}
