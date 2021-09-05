//
//  Tile.swift
//  
//
//  Created by Artem Myshkin on 22.07.2021.
//

import protocol ChainDetector.CDSearchableTile
import protocol ChainDetector.CDSearchableTileType

struct Tile: CDSearchableTile {

    var type: `Type`
}

extension Tile {

    enum `Type`: Int, CDSearchableTileType {

        case empty = 0
        case normal
        case double
        case tripple

        static var hole: Tile.`Type` = .empty

    }
    
}
