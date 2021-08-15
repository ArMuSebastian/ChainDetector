//
//  Chain.swift
//  
//
//  Created by Artem Myshkin on 19.07.2021.
//

public struct Chain<Element: SearchableElement> {

    public enum Model: Int, Hashable {

        case vertical = 1
        case horisontal = 2

    }

    private(set) public var type: Model
    private(set) public var elements: [Accommodation<Element>]

    public init(elements: [Accommodation<Element>], type: Model) {
        self.elements = elements
        self.type = type
    }

}

//extension Chain: Comparable {
//
//    static func < (lhs: Chain<Element>, rhs: Chain<Element>) -> Bool {
//        <#code#>
//    }
//
//}

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
