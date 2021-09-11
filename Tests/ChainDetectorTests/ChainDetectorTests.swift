import XCTest

import struct MathKit.Index

@testable import ChainDetector
//import class ChainDetector.ChainDetector

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

        
        let (board, checkingIndices, result) = TestableThings.ChainDetector.c1

        checkOneChainFromAnyStartingElementProducesSameChain(indices: checkingIndices, board: board) { chainsOnStep in
            XCTAssertEqual(result, chainsOnStep)
            XCTAssertEqual(Set(result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    func testAnyStartIndexOnCenterHorisontalRowProducesSameChain() {

        let (board, checkingIndices, result) = TestableThings.ChainDetector.c2

        checkOneChainFromAnyStartingElementProducesSameChain(indices: checkingIndices, board: board) { chainsOnStep in
            XCTAssertEqual(result, chainsOnStep)
            XCTAssertEqual(Set(result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    func testAnyStartIndexOnFirstHorisontalRowProducesSameChain() {

        let (board, checkingIndices, result) = TestableThings.ChainDetector.c3

        checkOneChainFromAnyStartingElementProducesSameChain(indices: checkingIndices, board: board) { chainsOnStep in
            XCTAssertEqual(result, chainsOnStep)
            XCTAssertEqual(Set(result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    // MARK: vertical line
    
    func testAnyStartIndexOnLastVerticalRowProducesSameChain() {

        let (board, checkingIndices, result) = TestableThings.ChainDetector.c4

        checkOneChainFromAnyStartingElementProducesSameChain(indices: checkingIndices, board: board) { chainsOnStep in
            XCTAssertEqual(result, chainsOnStep)
            XCTAssertEqual(Set(result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    func testAnyStartIndexOnCenterVerticalRowProducesSameChain() {

        let (board, checkingIndices, result) = TestableThings.ChainDetector.c5

        checkOneChainFromAnyStartingElementProducesSameChain(indices: checkingIndices, board: board) { chainsOnStep in
            XCTAssertEqual(result, chainsOnStep)
            XCTAssertEqual(Set(result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    func testAnyStartIndexOnirstVerticalRowProducesSameChain() {

        let (board, checkingIndices, result) = TestableThings.ChainDetector.c6

        checkOneChainFromAnyStartingElementProducesSameChain(indices: checkingIndices, board: board) { chainsOnStep in
            XCTAssertEqual(result, chainsOnStep)
            XCTAssertEqual(Set(result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
        }

    }

    // MARK: Doubled chain
    func testAnyStartIndexOnDoubledVerticalAndHorisontalChain1ProducesSameChains() {

        let (board, checkingIndices, result) = TestableThings.ChainDetector.c7

        checkOneChainFromAnyStartingElementProducesSameChain(indices: checkingIndices, board: board) { chainsOnStep in
            XCTAssertEqual(result, chainsOnStep)
            XCTAssertEqual(Set(result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
        } onCompletion: { chainSet in
            XCTAssertEqual(chainSet.count, 1)
            chainSet.forEach {
                print($0)
            }
            XCTAssertEqual(chainSet.first!.count, 2)
        }

    }

    func testAnyStartIndexOnDoubledVerticalAndHorisontalChain2ProducesSameChains() {

        let (board, checkingIndices, result) = TestableThings.ChainDetector.c8

        checkOneChainFromAnyStartingElementProducesSameChain(indices: checkingIndices, board: board) { chainsOnStep in
            XCTAssertEqual(result, chainsOnStep)
            XCTAssertEqual(Set(result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
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

        let (board, checkingIndices, result) = TestableThings.ChainDetector.c9

        checkOneChainFromAnyStartingElementProducesSameChain(indices: checkingIndices, board: board) { chainsOnStep in
            XCTAssertEqual(result, chainsOnStep)
            XCTAssertEqual(Set(result.flatMap { $0.elements }), Set(chainsOnStep.flatMap { $0.elements }))
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

    private func checkOneChainFromAnyStartingElementProducesSameChain(indices: [Index],
                                                                      board: Field<Entity, Tile>,
                                                                      onDetectChain chainsDetect: (([Chain<Entity>]) -> Void) = { _ in },
                                                                      onCompletion completion: ((Set<[Chain<Entity>]>) -> Void) = { _ in }) {

        var chains: [[Chain<Entity>]] = []
        for index in indices {

            let subChains: [Chain] = ChainDetector().detectChains(from: index, on: board).sorted()
            chains.append(subChains)
            chainsDetect(subChains)
        }

        completion(Set(chains))

    }

}
