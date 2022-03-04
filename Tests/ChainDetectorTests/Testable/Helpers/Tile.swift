struct SomeTile: CDSearchableTile {

    var type: `Type`

}

extension SomeTile {

    enum `Type`: Int, CDSearchableTileType {

        case empty = 0
        case normal
        case double
        case tripple

        static var hole: SomeTile.`Type` = .empty

    }
    
}
