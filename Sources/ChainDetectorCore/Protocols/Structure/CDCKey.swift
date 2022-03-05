//
//  CDCKey.swift
//  
//
//  Created by Artem Myshkin on 05.03.2022.
//

public protocol CDCKey: Hashable, Comparable {

    associatedtype Axis: CDCAxis
    associatedtype AxisPredicate: Hashable

    func predicate(for axis: Axis) -> AxisPredicate
    func applying(delta: Axis.Direction.Step) -> Self

}
