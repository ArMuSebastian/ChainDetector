//
//  CheckingMask.swift
//  
//
//  Created by Artem Myshkin on 03.08.2021.
//

extension ChainDetector {

    struct ChekingMask {

        typealias Index = CDIndex

        var performedChecks: [Index: Self.Check] = [:]

    }

}

extension ChainDetector.ChekingMask {

    mutating
    func consider(
        check performedSearch: ChainDetector.SearchAxis,
        at indices: [Index]
    ) {

        consider(check: check(for: performedSearch), at: indices)

    }

    mutating
    func consider(
        check performedSearch: ChainDetector.SearchAxis,
        at index: Index
    ) {

        consider(check: check(for: performedSearch), at: index)

    }

    func shouldBeChecked(
        at index: Index
    ) -> Bool {
        performedChecks[index] != .all
    }

    func search(
        for index: Index
    ) -> ChainDetector.SearchAxis? {
        let currentCheckStatus = performedChecks[index]

        let desiredSearch: ChainDetector.SearchAxis?
        switch currentCheckStatus {
        case .all:
            desiredSearch = nil
        case .vertical, .none:
            desiredSearch = .horisontal
        case .horisontal:
            desiredSearch = .vertical
        }

        return desiredSearch
    }

}

extension ChainDetector.ChekingMask {


    private
    func check(
        for search: ChainDetector.SearchAxis
    ) -> Check {
        switch search {
        case .vertical:
            return .vertical
        case .horisontal:
            return .horisontal
        }
    }

    private
    mutating
    func consider(
        check performedCheck: Check,
        at index: Index
    ) {

        if let currentCheckStatus = performedChecks[index] {
            performedChecks[index] = currentCheckStatus + performedCheck
        } else {
            performedChecks[index] = performedCheck
        }

    }

    private
    mutating
    func consider(
        check performedCheck: Check,
        at indices: [Index]
    ) {

        indices.forEach {
            consider(check: performedCheck, at: $0)
        }

    }

}
