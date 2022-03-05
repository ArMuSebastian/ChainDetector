protocol CellContainerRequirement: CDCellContainer {

    init(element: Element?, tile: Tile)

}

struct CellContainer<Element: ChainDetectorModule.Element, Tile: ChainDetectorModule.Tile>: CellContainerRequirement {

    var element: Element?
    var tile: Tile

}
