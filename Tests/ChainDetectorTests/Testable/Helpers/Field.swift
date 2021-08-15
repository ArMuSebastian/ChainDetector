//
//  Field.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//
import struct MatrixKit.Matrix
import struct MatrixKit.Index
import struct MatrixKit.Size

import protocol ChainDetector.Searchable

import protocol ChainDetector.SearchableElement
import protocol ChainDetector.SearchableTile

struct Field<Entity: SearchableElement, Tile: SearchableTile>: Searchable {

    private(set) var elements: Matrix<Entity?>
    private(set) var mask: Matrix<Tile>

    init(elements: Matrix<Entity?>, mask: Matrix<Tile>) {
        self.elements = elements
        self.mask = mask
    }

    var size: Size {
        return mask.size
    }

    func hasHole(at index: Index) -> Bool {
        mask[index].type == Tile.Kind.hole
    }

    subscript (by idx: Index) -> Entity? {
        return elements[idx]
    }

    subscript (by idx: Index) -> Tile {
        return mask[idx]
    }

}

extension Field: CustomStringConvertible {

    var description: String {
        return "\(elements)\n\(mask)"
    }

}
