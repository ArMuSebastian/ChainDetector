//
//  CheckingMask.swift
//  
//
//  Created by Artem Myshkin on 03.08.2021.
//

internal struct ChekingMask<Index: Hashable> {

    typealias CheckStatus = Check

    internal var performedChecks: [Index: CheckStatus] = [:]

}

extension ChekingMask {

    mutating
    internal func consider<Axis: Module.Core.CDAxis>(
        check performedSearch: Axis,
        at indices: [Index]
    ) {

        consider(check: check(for: performedSearch), at: indices)

    }

    mutating
    internal func consider<Axis: Module.Core.CDAxis>(
        check performedSearch: Axis,
        at index: Index
    ) {

        consider(check: check(for: performedSearch), at: index)

    }

    internal func shouldBeChecked(
        at index: Index
    ) -> Bool {
        performedChecks[index] != .all
    }

    internal func search<Axis: Module.Core.CDAxis>(
        for index: Index
    ) -> Axis? {
        let currentCheckStatus = performedChecks[index]

        let desiredSearch: Axis?
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

extension ChekingMask {

    private func check<Axis: Module.Core.CDAxis>(
        for search: Axis
    ) -> CheckStatus {
        switch search {
        case .vertical:
            return .vertical
        case .horisontal:
            return .horisontal
        default:
            fatalError("New search Axis is added, consider this")
        }
    }

    private
    mutating func consider(
        check performedCheck: CheckStatus,
        at index: Index
    ) {

        if let currentCheckStatus = performedChecks[index] {
            performedChecks[index] = currentCheckStatus + performedCheck
        } else {
            performedChecks[index] = performedCheck
        }

    }

    private
    mutating func consider(
        check performedCheck: CheckStatus,
        at indices: [Index]
    ) {

        indices.forEach {
            consider(check: performedCheck, at: $0)
        }

    }

}
