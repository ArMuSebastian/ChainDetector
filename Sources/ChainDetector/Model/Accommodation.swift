//
//  Accommodation.swift
//  
//
//  Created by Artem Myshkin on 21.07.2021.
//

import struct MathKit.Index

public struct Accommodation<Element: CDSearchableElement>  {

    public typealias Position = MathKit.Index

    public let element: Element
    public let position: Position

    public init(element: Element, position: Position) {
        self.element = element
        self.position = position
    }

}

extension Accommodation: Equatable {

    static
    public func == (lhs: Accommodation<Element>, rhs: Accommodation<Element>) -> Bool {
        return
            lhs.element.type == rhs.element.type
            &&
            lhs.position == rhs.position
    }

}

extension Accommodation: Hashable {

}
