protocol SingleStructure {

    associatedtype Key
    associatedtype Element

    func contains(_ key: Key) -> Bool
    subscript(_ key: Key) -> Element { get }

}

protocol DoubledStructure
where GenericKey == FirstStructure.Key, GenericKey == SecondStructure.Key,
      Content.Element == FirstStructure.Element, Content.Tile == SecondStructure.Element {

    associatedtype FirstStructure: SingleStructure
    associatedtype SecondStructure: SingleStructure

    associatedtype GenericKey: ChainDetectorModule.Key
    associatedtype Content: ChainDetectorModule.CellContainer

}

struct SomeBoard<InnerStructure: DoubledStructure>: ChainDetectorModule.Searchable {

    public typealias Structure = InnerStructure

    private(set) var elements: InnerStructure.FirstStructure
    private(set) var mask: InnerStructure.SecondStructure

    subscript(index: Structure.GenericKey) -> Structure.Content {
        let element = elements[index]
        let tile    = mask[index]
        return CellContent(element: element, tile: tile)
    }

    func contains(_ key: Structure.GenericKey) -> Bool {
        mask.contains(key) && elements.contains(key)
    }

}

extension SomeBoard: CustomStringConvertible {

    var description: String {
        return "\(elements)\n\(mask)"
    }

}


extension MathKit.Axis.Direction: ChainDetectorModule.Direction {

}

extension MathKit.Axis: ChainDetectorModule.Axis {
    
}

extension MathKit.Axis.Direction.Step: ChainDetectorModule.Step {
    
}


extension Index: ChainDetectorModule.Key {

    public typealias AxisPredicate = Int
    
    public typealias Axis = MathKit.Axis

    public func predicate(for axis: Axis) -> Int {
        switch axis {
        case .vertical:
            return self.column
        case .horisontal:
            return self.row
        }
    }
    
    public func applying(delta: Axis.Direction.Step) -> Index {
        self + delta
    }

    static
    public func + (index: Self, step: Axis.Direction.Step) -> Self {
        return Self(row: index.row + step.vertical,
                    column: index.column + step.horisontal)
    }

    static
    public func + (step: Axis.Direction.Step, index: Self) -> Self {
        return index + step
    }

}
