//
//  Tile.swift
//  
//
//  Created by Artem Myshkin on 22.07.2021.
//

import protocol ChainDetector.SearchableTile
import protocol ChainDetector.SearchableTileType

struct Tile: SearchableTile {

    var type: `Type`
}

extension Tile {

    enum `Type`: Int, SearchableTileType {

        case empty = 0
        case normal
        case double
        case tripple

        static var hole: Tile.`Type` = .empty

    }
    
}
