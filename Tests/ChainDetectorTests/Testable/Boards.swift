//
//  File.swift
//  
//
//  Created by Artem Myshkin on 22.07.2021.
//

import struct MatrixKit.Matrix
import protocol ChainDetector.CDSearchableElement
import protocol ChainDetector.CDSearchableTile

extension TestableThings {

    struct Board {

        private init() {}

        static var h1 = Board.create(from: TestableThings.BoardPayload.h1)
        static var h2 = Board.create(from: TestableThings.BoardPayload.h2)
        static var h3 = Board.create(from: TestableThings.BoardPayload.h3)


        static var v1 = Board.create(from: TestableThings.BoardPayload.v1)
        static var v2 = Board.create(from: TestableThings.BoardPayload.v2)
        static var v3 = Board.create(from: TestableThings.BoardPayload.v3)


        static var d1 = Board.create(from: TestableThings.BoardPayload.d1)
        static var d2 = Board.create(from: TestableThings.BoardPayload.d2)


        static var o2 = Board.create(from: TestableThings.BoardPayload.hole1)
    }

}

extension TestableThings.Board {

    static func create<Entity: CDSearchableElement, Tile: CDSearchableTile>(
        from entityMatrix: MatrixKit.Matrix<Entity?>,
        and tileMatrix: MatrixKit.Matrix<Tile>
    ) -> Field<Entity, Tile> {
        
        .init(elements: entityMatrix, mask: tileMatrix)
    }

    static func create(
        from payload: TestableThings.BoardPayload.Payload
    ) -> Field<TestableThings.BoardPayload.SomeEntity, TestableThings.BoardPayload.SomeTile>
    {
        
        self.create(from: payload.elements, and: payload.mask)
    }
}
