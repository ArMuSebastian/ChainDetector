struct SomeTile: ChainDetectorModule.Tile {

    var type: `Type`

}

extension SomeTile {

    enum `Type`: Int, ChainDetectorModule.TileType {

        case empty = 0
        case normal
        case double
        case tripple

        static var hole: SomeTile.`Type` = .empty

    }

}
