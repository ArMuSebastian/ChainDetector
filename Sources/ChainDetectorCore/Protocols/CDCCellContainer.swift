//
//  CDCCellContainer.swift
//  
//
//  Created by Artem Myshkin on 02.03.2022.
//

import Foundation

public protocol CDCCellContainer {

    associatedtype Element: CDCSearchableElement
    associatedtype Tile: CDCSearchableTile

    var element: Element? { get }
    var tile: Tile { get }

}
