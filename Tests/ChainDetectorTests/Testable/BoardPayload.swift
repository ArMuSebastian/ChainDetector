//
//  BoardPayload.swift
//  
//
//  Created by Artem Myshkin on 25.07.2021.
//

import struct MathKit.Matrix
import struct MathKit.Size

extension TestableThings {

    struct BoardPayload {

        typealias SomeEntity = Entity
        typealias SomeTile = Tile
        typealias MatrixOfElements = Matrix<SomeEntity?>
        typealias MatrixOfTiles = Matrix<SomeTile>
        typealias Payload = (elements: MatrixOfElements, mask: MatrixOfTiles)

        private init() {}

        static var h1: Payload {

            let types = createTypes(
                [
                    [.a, .b, .c, .d],
                    [.b, .c, .d, .d],
                    [.c, .d, .a, .b],
                    [.a, .a, .a, .a]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMask(.fromSize(elements.size))
            return (elements, mask)
        }

        static var h2: Payload {

            let types = createTypes(
                [
                    [.a, .b, .c, .d],
                    [.b, .c, .d, .d],
                    [.a, .a, .a, .a],
                    [.c, .d, .a, .b],
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMask(.fromSize(elements.size))
            return (elements, mask)
        }

        static var h3: Payload {

            let types = createTypes(
                [
                    [.a, .a, .a, .a],
                    [.a, .b, .c, .d],
                    [.b, .c, .d, .d],
                    [.c, .d, .a, .b],
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMask(.fromSize(elements.size))
            return (elements, mask)
        }


        static var v1: Payload {

            let types = createTypes(
                [
                    [.a, .b, .c, .d],
                    [.b, .c, .d, .d],
                    [.c, .d, .a, .d],
                    [.a, .b, .c, .d]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMask(.fromSize(elements.size))
            return (elements, mask)
        }

        static var v2: Payload {

            let types = createTypes(
                [
                    [.a, .b, .d, .c],
                    [.b, .c, .d, .d],
                    [.c, .d, .d, .a],
                    [.a, .b, .d, .c]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMask(.fromSize(elements.size))
            return (elements, mask)
        }

        static var v3: Payload {

            let types = createTypes(
                [
                    [ .d, .a, .b, .c],
                    [ .d, .b, .c, .d],
                    [ .d, .c, .d, .a],
                    [ .d, .a, .b, .c]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMask(.fromSize(elements.size))
            return (elements, mask)
        }

        static var d1: Payload {

            let types = createTypes(
                [
                    [ .d, .a, .b, .c],
                    [ .d, .d, .d, .d],
                    [ .d, .c, .d, .a],
                    [ .d, .a, .b, .c]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMask(.fromSize(elements.size))
            return (elements, mask)
        }

        static var d2: Payload {

            let types = createTypes(
                [
                    [ .d, .a, .d, .d],
                    [ .d, .d, .d, .d],
                    [ .d, .c, .d, .d],
                    [ .d, .a, .d, .c]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMask(.fromSize(elements.size))
            return (elements, mask)
        }

        static var hole1: Payload {

            let types = createTypes(
                [
                    [.a, .b, .c, .d],
                    [.a, .a, .a, .a],
                    [.b, .c, .d, .d],
                    [.c, .d, .a, .b],
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMask(.some(
                [
                    [.normal, .normal, .normal, .normal],
                    [.normal, .hole,   .normal, .normal],
                    [.normal, .normal, .normal, .normal],
                    [.normal, .normal, .normal, .normal],
                ]
            ))
            return (elements, mask)
        }

    }

}

extension TestableThings.BoardPayload {

    typealias ElementKind = SomeEntity.Kind
    private typealias ElementTypesArray = [[ElementKind]]

    private enum MaskCreation {
        case some([[MatrixOfTiles.Element.Kind]])
        case fromSize(MathKit.Size)
    }
    
    static
    private func createTypes(_ types: [[ElementKind]]) -> ElementTypesArray {
        
        return types
    }

    static
    private func createElementsMatrix(from types: ElementTypesArray) -> MatrixOfElements {
        return try! MatrixOfElements.init(with: types.map { $0.map(SomeEntity.init(type:)) })
    }

    static
    private func createMask(_ creation: MaskCreation) -> MatrixOfTiles {
        switch creation {
        case .fromSize(let size):
            let tiles = (0..<size.columns).map { _ in
                return (0..<size.rows).map { _ in return Tile(type: Tile.Kind.normal) }
            }
            return try! MatrixOfTiles.init(with: tiles)
        case .some(let types):
            return try! MatrixOfTiles.init(with: types.map { $0.map { .init(type: $0) } } )
        }
    }

}
