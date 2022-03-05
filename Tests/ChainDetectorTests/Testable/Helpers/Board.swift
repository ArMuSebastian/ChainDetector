import MatrixKit
//struct SomeBoard<Cell: ChainDetectorModule.CellContainer>: ChainDetectorModule.Searchable {
//
//    typealias Key = Index
//    typealias Content = Cell
//
//    private(set) var elements: Matrix<Element>
//    private(set) var mask: Matrix<Tile>
//
//    init(elements: Matrix<Element>, mask: Matrix<Tile>) {
//        self.elements = elements
//        self.mask = mask
//    }
//
//    var size: Size {
//        return mask.size
//    }
//
//    func contains(_ key: Index) -> Bool {
//        self.size.contains(key)
//    }
//
//    subscript(index: Index) -> Content {
//        Content(element: self[by: index], tile: self[by: index])
//    }
//
//    subscript(by idx: Index) -> Element? {
//        return elements[idx]
//    }
//
//    subscript(by idx: Index) -> Tile {
//        return mask[idx]
//    }
//
//}

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
