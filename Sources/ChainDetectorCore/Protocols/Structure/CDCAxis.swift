//
//  CDCAxis.swift
//  
//
//  Created by Artem Myshkin on 05.03.2022.
//

public protocol CDCStep {

    var horisontal: Int { get }
    var vertical: Int { get }

    static
    func * (directionDelta: Self, multiplier: Int) -> Self

    static
    func * (multiplier: Int, directionDelta: Self) -> Self

}

public protocol CDCDirection {

    associatedtype Step: CDCStep

    static var none: Self { get }
    static var left: Self { get }
    static var right: Self { get }
    static var up: Self { get }
    static var down: Self { get }

    var delta: Step { get }

}

public protocol CDCAxis: Equatable {

    associatedtype Direction: CDCDirection

    static var vertical: Self { get }
    static var horisontal: Self { get }

    var directions: (first: Direction, second: Direction) { get }

}
