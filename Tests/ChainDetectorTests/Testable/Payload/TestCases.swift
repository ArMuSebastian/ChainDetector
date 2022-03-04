extension TestableThings {

    struct ChainDetector {

        struct TestCase<Cell: CellContainerRequirement> {

            var board: TheBoard<Cell>
            var indices: [Index]
            var result: [Chain<Cell.Element>]

        }

        typealias ThisCell = TheBoardCell<TheElement, TheTile>
        typealias TheTestCase = TestCase<ThisCell>


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
                               board: TestableThings.Board.h1)
        }

        static var c2: TheTestCase {

            return composeTest(indices: [(0...3).map { .init(row: 2, column: $0) }],
                               board: TestableThings.Board.h2)
        }

        static var c3: TheTestCase {

            return composeTest(indices: [(0...3).map { .init(row: 0, column: $0) }],
                               board: TestableThings.Board.h3)
        }

        
        static var c4: TheTestCase {

            return composeTest(indices: [(0...3).map { .init(row: $0, column: 3) }],
                               board: TestableThings.Board.v1)
        }

        static var c5: TheTestCase {

            return composeTest(indices: [(0...3).map { .init(row: $0, column: 2) }],
                               board: TestableThings.Board.v2)
        }

        static var c6: TheTestCase {

            return composeTest(indices: [(0...3).map { .init(row: $0, column: 0) }],
                               board: TestableThings.Board.v3)
        }

        static var c7: TheTestCase {

            return composeTest(indices:
                                [(0...3).map { .init(row: $0, column: 0) }]
                                +
                                [(0...3).map { .init(row: 1, column: $0) }],
                               board: TestableThings.Board.d1)
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
                               board: TestableThings.Board.d2)
        }

        static var c9: TheTestCase {

            return composeTest(indices: [(1...3).map { .init(row: 1, column: $0) }],
                               board: TestableThings.Board.o2,
                               producesChains: false)
        }

    }

}

extension TestableThings.ChainDetector {

    static private func chainsFrom<Cell: CellContainerRequirement>(
        board: TheBoard<Cell>,
        indices: [[Index]]
    ) -> [Chain<Cell.Element>] {
        let chains: [Chain<Cell.Element>] = indices.map { chainIndices in
            let elements = chainIndices.map { index -> Accommodation<Cell.Element> in
                let e: Cell.Element = board[by: index]!
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


    static private func composeTest<Cell: CellContainerRequirement>(
        indices: [[Index]],
        board: TheBoard<Cell>,
        producesChains: Bool = true
    ) -> TestCase<Cell> {
        let result = producesChains ? chainsFrom(board: board, indices: indices) : []

        return TestCase(
            board: board,
            indices: indices.reduce([]) { $0 + $1 },
            result: result.sorted()
        )
    }

}
