protocol CellContainerRequirement: CDCellContainer {

    init(element: Element?, tile: Tile)

}

struct CellContainer<Element: CDSearchableElement, Tile: CDSearchableTile>: CellContainerRequirement {

    var element: Element?
    var tile: Tile

}
