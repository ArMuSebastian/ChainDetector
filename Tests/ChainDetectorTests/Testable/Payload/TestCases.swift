extension TestableThings {

    struct ChainDetector {

        struct TestCase<Struct: DoubledStructure> {

            typealias Board = TheBoard<Struct>
            typealias Chaining = Chain<Struct.Content.Element, Struct.GenericKey>
            typealias Index = Struct.GenericKey

            var board: Board
            var indices: [Index]
            var result: [Chaining]

        }

        typealias Struct = DoubleStruct
        typealias TheTestCase = TestCase<DoubleStruct>

        private init() {}

        static var allCases: [TheTestCase] {
            return
                [
                    c1, c2, c3,
                    c4, c5, c6,
                ]
        }
        
        static var c1: TheTestCase {

            return composeTest(indices: [(0...3).map { .init(row: 3, column: $0) }],
                               board: TestableThings.Board.create(from: .h1))
        }

        static var c2: TheTestCase {

            return composeTest(indices: [(0...3).map { .init(row: 2, column: $0) }],
                               board: TestableThings.Board.create(from: .h2))
        }

        static var c3: TheTestCase {

            return composeTest(indices: [(0...3).map { .init(row: 0, column: $0) }],
                               board: TestableThings.Board.create(from: .h3))
        }

        
        static var c4: TheTestCase {

            return composeTest(indices: [(0...3).map { .init(row: $0, column: 3) }],
                               board: TestableThings.Board.create(from: .v1))
        }

        static var c5: TheTestCase {

            return composeTest(indices: [(0...3).map { .init(row: $0, column: 2) }],
                               board: TestableThings.Board.create(from: .v2))
        }

        static var c6: TheTestCase {

            return composeTest(indices: [(0...3).map { .init(row: $0, column: 0) }],
                               board: TestableThings.Board.create(from: .v3))
        }

        static var c7: TheTestCase {

            return composeTest(indices:
                                [(0...3).map { .init(row: $0, column: 0) }]
                                +
                                [(0...3).map { .init(row: 1, column: $0) }],
                               board: TestableThings.Board.create(from: .d1))
        }

        static var c8: TheTestCase {

            return composeTest(indices:
                                [(0...3).map { .init(row: $0, column: 0) }]
                                +
                                [(0...3).map { .init(row: 1, column: $0) }]
                                +
                                [(0...3).map { .init(row: $0, column: 2) }]
                                +
                                [(0...2).map { .init(row: $0, column: 3) }],
                               board: TestableThings.Board.create(from: .d2))
        }

        static var c9: TheTestCase {

            return composeTest(indices: [(1...3).map { .init(row: 1, column: $0) }],
                               board: TestableThings.Board.create(from: .hole1),
                               producesChains: false)
        }

    }

}

extension TestableThings.ChainDetector {

    static private func chainsFrom<Struct: DoubledStructure>(
        board: TestCase<Struct>.Board,
        indices: [[TestCase<Struct>.Index]]
    ) -> [TestCase<Struct>.Chaining] {
        let chains: [TestCase<Struct>.Chaining] = indices.map { chainIndices in
            let elements = chainIndices.map { index -> Accommodation<Struct.Content.Element, Struct.GenericKey> in
                let e: Struct.Content.Element = board[index].element!
                return Accommodation(element: e, key: index)
            }
            
            if Set(chainIndices.map({ $0.predicate(for: .vertical) })).count == 1 {
                return Chain(elements: elements, type: .vertical)
            } else if Set(chainIndices.map({ $0.predicate(for: .horisontal) })).count == 1 {
                return Chain(elements: elements, type: .horisontal)
            }
            
            fatalError()
        }
        return chains
    }


    static private func composeTest<Struct: DoubledStructure>(
        indices: [[TestCase<Struct>.Index]],
        board: TestCase<Struct>.Board,
        producesChains: Bool = true
    ) -> TestCase<Struct> {
        let result = producesChains ? chainsFrom(board: board, indices: indices) : []

        return TestCase(
            board: board,
            indices: indices.reduce([]) { $0 + $1 },
            result: result.sorted()
        )
    }

}
