//
//  CheckingMask.swift
//  
//
//  Created by Artem Myshkin on 03.08.2021.
//

import struct MatrixKit.Index

extension ChainDetector {

    struct ChekingMask {

        var performedChecks: [MatrixKit.Index: Self.Check] = [:]

    }

}

extension ChainDetector.ChekingMask {

    mutating
    func consider(
        check performedSearch: ChainDetector.Search,
        at indices: [MatrixKit.Index]
    ) {

        consider(check: check(for: performedSearch), at: indices)

    }

    mutating
    func consider(
        check performedSearch: ChainDetector.Search,
        at index: MatrixKit.Index
    ) {

        consider(check: check(for: performedSearch), at: index)

    }

    func shouldBeChecked(
        at index: MatrixKit.Index
    ) -> Bool {
        performedChecks[index] != .all
    }

    func search(
        for index: MatrixKit.Index
    ) -> ChainDetector.Search? {
        let currentCheckStatus = performedChecks[index]

        let desiredSearch: ChainDetector.Search?
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
        for search: ChainDetector.Search
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
        at index: MatrixKit.Index
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
        at indices: [MatrixKit.Index]
    ) {

        indices.forEach {
            consider(check: performedCheck, at: $0)
        }

    }

}
