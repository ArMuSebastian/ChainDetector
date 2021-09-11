//
//  Chain.swift
//  
//
//  Created by Artem Myshkin on 19.07.2021.
//

import ChainDetector
import MathKit

public struct Chain<Element: CDSearchableElement>: CDCombo {

    private(set) public var type: Axis
    private(set) public var elements: [Accommodation<Element>]

    public init(elements: [Accommodation<Element>], type: Axis) {
        self.elements = elements
        self.type = type
    }

}

extension Chain: Comparable {

    // chain 1 bigger than chain 2
    // if chain 1 most top element if topper that chain 2 most top element
    // if chain 1 most left element if lefter that chain 2 most left element
    static
    public func < (lhs: Chain<Element>, rhs: Chain<Element>) -> Bool {
        switch (lhs.type, rhs.type) {
        case (.vertical, .horisontal):
            return lhs.elements.last!.position < rhs.elements.first!.position
        case (.horisontal, .vertical):
            return lhs.elements.first!.position < rhs.elements.last!.position
        case (.horisontal, .horisontal), (.vertical, .vertical):
            return lhs.elements.first!.position < rhs.elements.first!.position
        }
    }

}

extension Chain: Equatable {

    static
    public func == (lhs: Chain<Element>, rhs: Chain<Element>) -> Bool {
        return
            lhs.elements == rhs.elements
            &&
            lhs.type == rhs.type
    }

}

extension Chain: Hashable {

}
