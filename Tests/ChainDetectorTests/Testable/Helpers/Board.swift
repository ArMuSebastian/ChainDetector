struct SomeBoard<Cell: CellContainerRequirement>: CDSearchable {

    typealias Content = Cell
    typealias Element = Content.Element
    typealias Tile = Content.Tile

    private(set) var elements: Matrix<Element>
    private(set) var mask: Matrix<Tile>

    init(elements: Matrix<Element>, mask: Matrix<Tile>) {
        self.elements = elements
        self.mask = mask
    }

    var size: Size {
        return mask.size
    }

    subscript(index: Index) -> Content {
        Content(element: self[by: index], tile: self[by: index])
    }

    subscript(by idx: Index) -> Element? {
        return elements[idx]
    }

    subscript(by idx: Index) -> Tile {
        return mask[idx]
    }

}

extension SomeBoard: CustomStringConvertible {

    var description: String {
        return "\(elements)\n\(mask)"
    }

}
