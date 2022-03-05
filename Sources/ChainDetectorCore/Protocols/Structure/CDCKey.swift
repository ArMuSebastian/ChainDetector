//
//  CDCKey.swift
//  
//
//  Created by Artem Myshkin on 05.03.2022.
//

public protocol CDCKey: Hashable, Comparable {

    associatedtype Axis: CDCAxis

    func applying(delta: Axis.Direction.Step) -> Self

}
