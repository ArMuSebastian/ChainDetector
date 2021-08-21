//
//  File.swift
//  
//
//  Created by Artem Myshkin on 25.07.2021.
//

import struct ChainDetector.Chain
@testable import struct ChainDetector.Accommodation
import struct MatrixKit.Index


extension TestableThings {
    
    struct ChainDetector {

        typealias TestCase = (board: Field<Entity, Tile>, indices: [Index], result: [Chain<Entity>])

        private init() {}

        static var allCases: [TestCase] {
            return
                [
                    c1, c2, c3,
                    c4, c5, c6,
                ]
        }
        
        static var c1: TestCase {

            return composeTest(indices: [(0...3).map { .init(row: 3, column: $0) }],
                               board: TestableThings.Board.h1)
        }

        static var c2: TestCase {

            return composeTest(indices: [(0...3).map { .init(row: 2, column: $0) }],
                               board: TestableThings.Board.h2)
        }

        static var c3: TestCase {

            return composeTest(indices: [(0...3).map { .init(row: 0, column: $0) }],
                               board: TestableThings.Board.h3)
        }

        
        static var c4: TestCase {

            return composeTest(indices: [(0...3).map { .init(row: $0, column: 3) }],
                               board: TestableThings.Board.v1)
        }

        static var c5: TestCase {

            return composeTest(indices: [(0...3).map { .init(row: $0, column: 2) }],
                               board: TestableThings.Board.v2)
        }

        static var c6: TestCase {

            return composeTest(indices: [(0...3).map { .init(row: $0, column: 0) }],
                               board: TestableThings.Board.v3)
        }

        static var c7: TestCase {

            return composeTest(indices:
                                [(0...3).map { .init(row: $0, column: 0) }]
                                +
                                [(0...3).map { .init(row: 1, column: $0) }],
                               board: TestableThings.Board.d1)
        }

        static var c8: TestCase {

            return composeTest(indices:
                                [(0...3).map { .init(row: $0, column: 0) }]
                                +
                                [(0...3).map { .init(row: 1, column: $0) }]
                                +
                                [(0...3).map { .init(row: $0, column: 2) }]
                                +
                                [(0...2).map { .init(row: $0, column: 3) }],
                               board: TestableThings.Board.d2)
        }

        static var c9: TestCase {

            return composeTest(indices: [(1...3).map { .init(row: 1, column: $0) }],
                               board: TestableThings.Board.o2,
                               producesChains: false)
        }

    }

}

extension TestableThings.ChainDetector {

    static private func chainsFrom(board: Field<Entity, Tile>, indices: [[Index]]) -> [Chain<Entity>] {
        let chains: [Chain<Entity>] = indices.map { chainIndices in
            let elements = chainIndices.map { index -> Accommodation<Entity> in
                let e: Entity = board[by: index]!
                return Accommodation(element: e, position: index)
            }
            
            if Set(chainIndices.map({ $0.column })).count == 1 {
                return Chain(elements: elements, type: .vertical)
            } else if Set(chainIndices.map({ $0.row })).count == 1 {
                return Chain(elements: elements, type: .horisontal)
            }
            
            fatalError()
        }
        return chains
    }

    private typealias BoardSimple = Field<Entity, Tile>

    static private func composeTest(indices: [[Index]], board: BoardSimple, producesChains: Bool = true) -> TestCase {
        let result = producesChains ? chainsFrom(board: board, indices: indices) : []

        return
            (
                board,
                indices.reduce([]) { $0 + $1 },
                result.sorted()
            )
    }

}
