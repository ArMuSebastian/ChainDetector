import XCTest

@testable import ChainDetector

final class ChainDetectorTests: XCTestCase {

    // no chain
    func testAnyOnNonCahinedElementProduceNoChain() {
        let arrayOfTests = TestableThings.ChainDetector.allCases

        for (testIndex, test) in arrayOfTests.enumerated() {
            let nonMatchingIndices = Set(test.board.elements.indices).subtracting(test.indices)

            nonMatchingIndices.sorted().forEach { index in
                let chains: [Chain] = ChainDetector().detectChains(from: index, on: test.board)
                XCTAssertTrue(chains.isEmpty,
                              "Failed test \(testIndex) index \(index): must produce no chain")
            }
        }

    }

    // MARK: Horisontal line
    func testAnyStartIndexOnLastHorisontalRowProducesSameChain() {

        let test = TestableThings.ChainDetector.c1

        checkOneChainFromAnyStartingElementProducesSameChain(indices: test.indices, board: test.board) { chainsOnStep in
            XCTAssertEqual(test.result, chainsOnStep)
            XCTAssertEqual(Set(test.result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    func testAnyStartIndexOnCenterHorisontalRowProducesSameChain() {

        let test = TestableThings.ChainDetector.c2

        checkOneChainFromAnyStartingElementProducesSameChain(indices: test.indices, board: test.board) { chainsOnStep in
            XCTAssertEqual(test.result, chainsOnStep)
            XCTAssertEqual(Set(test.result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    func testAnyStartIndexOnFirstHorisontalRowProducesSameChain() {

        let test = TestableThings.ChainDetector.c3

        checkOneChainFromAnyStartingElementProducesSameChain(indices: test.indices, board: test.board) { chainsOnStep in
            XCTAssertEqual(test.result, chainsOnStep)
            XCTAssertEqual(Set(test.result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    // MARK: vertical line
    func testAnyStartIndexOnLastVerticalRowProducesSameChain() {

        let test = TestableThings.ChainDetector.c4

        checkOneChainFromAnyStartingElementProducesSameChain(indices: test.indices, board: test.board) { chainsOnStep in
            XCTAssertEqual(test.result, chainsOnStep)
            XCTAssertEqual(Set(test.result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    func testAnyStartIndexOnCenterVerticalRowProducesSameChain() {

        let test = TestableThings.ChainDetector.c5

        checkOneChainFromAnyStartingElementProducesSameChain(indices: test.indices, board: test.board) { chainsOnStep in
            XCTAssertEqual(test.result, chainsOnStep)
            XCTAssertEqual(Set(test.result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    func testAnyStartIndexOnirstVerticalRowProducesSameChain() {

        let test = TestableThings.ChainDetector.c6

        checkOneChainFromAnyStartingElementProducesSameChain(indices: test.indices, board: test.board) { chainsOnStep in
            XCTAssertEqual(test.result, chainsOnStep)
            XCTAssertEqual(Set(test.result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    // MARK: Doubled chain
    func testAnyStartIndexOnDoubledVerticalAndHorisontalChain1ProducesSameChains() {

        let test = TestableThings.ChainDetector.c7

        checkOneChainFromAnyStartingElementProducesSameChain(indices: test.indices, board: test.board) { chainsOnStep in
            XCTAssertEqual(test.result, chainsOnStep)
            XCTAssertEqual(Set(test.result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
            chainSet.forEach {
                print($0)
            }
            XCTAssertEqual(chainSet.first!.count, 2)
        }

    }

    func testAnyStartIndexOnDoubledVerticalAndHorisontalChain2ProducesSameChains() {

        let test = TestableThings.ChainDetector.c8

        checkOneChainFromAnyStartingElementProducesSameChain(indices: test.indices, board: test.board) { chainsOnStep in
            XCTAssertEqual(test.result, chainsOnStep)
            XCTAssertEqual(Set(test.result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
            chainSet.forEach {
                print($0)
            }
            XCTAssertEqual(chainSet.first!.count, 4)
        }

    }

    // MARK: Board with holes
    func testHoleBreaksChain() {

        let test = TestableThings.ChainDetector.c9

        checkOneChainFromAnyStartingElementProducesSameChain(indices: test.indices, board: test.board) { chainsOnStep in
            XCTAssertEqual(test.result, chainsOnStep)
            XCTAssertEqual(Set(test.result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
            chainSet.forEach {
                print($0)
            }
            XCTAssertEqual(chainSet.first!.count, 0)
        }

    }

}

extension ChainDetectorTests {

    private func checkOneChainFromAnyStartingElementProducesSameChain<Cell: CellContainerRequirement>(
        indices: [Index],
        board: TheBoard<Cell>,
        onDetectChain chainsDetect: (([Chain<Cell.Element>]) -> Void) = { _ in },
        onCompletion completion: ((Set<[Chain<Cell.Element>]>) -> Void) = { _ in }
    ) {

        var chains: [[Chain<Cell.Element>]] = []
        for index in indices[0...0] {

            let subChains: [Chain] = ChainDetector().detectChains(from: index, on: board).sorted()
            chains.append(subChains)
            chainsDetect(subChains)
        }

        completion(Set(chains))

    }

}
