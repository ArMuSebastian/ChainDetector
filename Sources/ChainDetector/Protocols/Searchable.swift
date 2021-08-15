//
//  Searchable.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

import struct MatrixKit.Size
import struct MatrixKit.Matrix

public protocol Searchable {

    associatedtype Element: SearchableElement
    associatedtype Tile: SearchableTile

    var elements: Matrix<Element?> { get }
    var mask: Matrix<Tile> { get }
    var size: Size { get }

}
