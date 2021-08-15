//
//  File.swift
//  
//
//  Created by Artem Myshkin on 25.07.2021.
//

import Foundation
@testable import ChainDetector
import MatrixKit


extension TestableThings {
    
    struct ChainDetector {
        private init() {}

        static var allCases: [(board: Field<Entity, Tile>, indices: [Index], result: [Chain<Entity>])] {
            return
                [
                    c1, c2, c3,
                    c4, c5, c6,
                ]
        }
        
        static var c1: (board: Field<Entity, Tile>, indices: [Index], result: [Chain<Entity>]) {
            let indices: [Index] = (0...3).map { .init(row: 3, column: $0) }
            let board = TestableThings.Board.h1
            let result = chainsFrom(board: board, indices: [indices])

            return
                (
                    board,
                    indices,
                    result
                )
        }

        static var c2: (board: Field<Entity, Tile>, indices: [Index], result: [Chain<Entity>]) {
            let indices: [Index] = (0...3).map { .init(row: 2, column: $0) }
            let board = TestableThings.Board.h2
            let result = chainsFrom(board: board, indices: [indices])

            return
                (
                    board,
                    indices,
                    result
                )
        }

        static var c3: (board: Field<Entity, Tile>, indices: [Index], result: [Chain<Entity>]) {
            let indices: [Index] = (0...3).map { .init(row: 0, column: $0) }
            let board = TestableThings.Board.h3
            let result = chainsFrom(board: board, indices: [indices])

            return
                (
                    board,
                    indices,
                    result
                )
        }

        
        static var c4: (board: Field<Entity, Tile>, indices: [Index], result: [Chain<Entity>]) {
            let indices: [Index] = (0...3).map { .init(row: $0, column: 3) }
            let board = TestableThings.Board.v1
            let result = chainsFrom(board: board, indices: [indices])

            return
                (
                    board,
                    indices,
                    result
                )
        }

        static var c5: (board: Field<Entity, Tile>, indices: [Index], result: [Chain<Entity>]) {
            let indices: [Index] = (0...3).map { .init(row: $0, column: 2) }
            let board = TestableThings.Board.v2
            let result = chainsFrom(board: board, indices: [indices])

            return
                (
                    board,
                    indices,
                    result
                )
        }

        static var c6: (board: Field<Entity, Tile>, indices: [Index], result: [Chain<Entity>]) {
            let indices: [Index] = (0...3).map { .init(row: $0, column: 0) }
            let board = TestableThings.Board.v3
            let result = chainsFrom(board: board, indices: [indices])

            return
                (
                    board,
                    indices,
                    result
                )
        }

        static var c7: (board: Field<Entity, Tile>, indices: [Index], result: [Chain<Entity>]) {
            let indices: [[Index]] =
                [(0...3).map { .init(row: $0, column: 0) }]
                +
                [(0...3).map { .init(row: 1, column: $0) }]
            let board = TestableThings.Board.d1
            let result = chainsFrom(board: board, indices: indices)

            return
                (
                    board,
                    indices.reduce([]) { $0 + $1 },
                    result
                )
        }

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

    }

}
