public struct Chain<Element: ChainDetectorModule.Element, Key: ChainDetectorModule.Key>: ChainDetectorModule.Combination {

    private(set) public var type: Key.Axis
    private(set) public var elements: [Accommodation<Element, Key>]

    public init(elements: [Accommodation<Element, Key>], type: Key.Axis) {
        self.elements = elements
        self.type = type
    }

}

extension Chain: Comparable {

    // chain 1 bigger than chain 2
    // if chain 1 most top element if topper that chain 2 most top element
    // if chain 1 most left element if lefter that chain 2 most left element
    static
    public func < (lhs: Chain<Element, Key>, rhs: Chain<Element, Key>) -> Bool {
        switch (lhs.type, rhs.type) {
        case (.vertical, .horisontal):
            return lhs.elements.last!.key < rhs.elements.first!.key
        case (.horisontal, .vertical):
            return lhs.elements.first!.key < rhs.elements.last!.key
        case (.horisontal, .horisontal), (.vertical, .vertical):
            return lhs.elements.first!.key < rhs.elements.first!.key
        default:
            fatalError()
        }
    }

}

extension Chain: Equatable {

    static
    public func == (lhs: Chain<Element, Key>, rhs: Chain<Element, Key>) -> Bool {
        return
            lhs.elements == rhs.elements
            &&
            lhs.type == rhs.type
    }

}

extension Chain: Hashable {

}
