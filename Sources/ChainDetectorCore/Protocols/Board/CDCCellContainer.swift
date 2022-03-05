//
//  CDCCellContainer.swift
//  
//
//  Created by Artem Myshkin on 02.03.2022.
//

import Foundation

public protocol CDCCellContainer {

    associatedtype Element: CDCElement
    associatedtype Tile: CDCTile

    var element: Element? { get }
    var tile: Tile { get }

    init(element: Element?, tile: Tile)
}
