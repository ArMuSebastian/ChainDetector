public struct Accommodation<Element: ChainDetectorModule.Element, Key: ChainDetectorModule.Key>: ChainDetectorModule.Echalon {

    public let element: Element
    public let key: Key

    public init(element: Element, key: Key) {
        self.element = element
        self.key = key
    }

}

extension Accommodation: Equatable {

    static
    public func == (lhs: Accommodation<Element, Key>, rhs: Accommodation<Element, Key>) -> Bool {
        return
            lhs.element.type == rhs.element.type
            &&
            lhs.key == rhs.key
    }

}

extension Accommodation: Hashable {

}
