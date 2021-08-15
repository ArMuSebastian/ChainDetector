//
//  File.swift
//  
//
//  Created by Artem Myshkin on 22.07.2021.
//

import Foundation
@testable import ChainDetector
import MatrixKit

import protocol ChainDetector.SearchableElement
import protocol ChainDetector.SearchableElementType

import protocol ChainDetector.SearchableTile
import protocol ChainDetector.SearchableTileType

extension TestableThings {

    struct Board {
        
        private init() {}


        static func create<Entity: SearchableElement, Tile: SearchableTile>(
            from entityMatrix: MatrixKit.Matrix<Entity?>,
            and tileMatrix: MatrixKit.Matrix<Tile>
        ) -> Field<Entity, Tile> {
            
            .init(elements: entityMatrix, mask: tileMatrix)
        }

        static var h1: Field<Entity, Tile> = Board.create(from: TestableThings.BoardPayload.h1.elements,
                                                                            and: TestableThings.BoardPayload.h1.mask)

        static var h2: Field<Entity, Tile> = Board.create(from: TestableThings.BoardPayload.h2.elements,
                                                                            and: TestableThings.BoardPayload.h2.mask)

        static var h3: Field<Entity, Tile> = Board.create(from: TestableThings.BoardPayload.h3.elements,
                                                                            and: TestableThings.BoardPayload.h3.mask)

        
        
        static var v1: Field<Entity, Tile> = Board.create(from: TestableThings.BoardPayload.v1.elements,
                                                                            and: TestableThings.BoardPayload.v1.mask)

        static var v2: Field<Entity, Tile> = Board.create(from: TestableThings.BoardPayload.v2.elements,
                                                                            and: TestableThings.BoardPayload.v2.mask)

        static var v3: Field<Entity, Tile> = Board.create(from: TestableThings.BoardPayload.v3.elements,
                                                                            and: TestableThings.BoardPayload.v3.mask)
        
        static var d1: Field<Entity, Tile> = Board.create(from: TestableThings.BoardPayload.d1.elements,
                                                                            and: TestableThings.BoardPayload.d1.mask)
    }

}
