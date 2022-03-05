//
//  BoardStructure.swift
//  
//
//  Created by Artem Myshkin on 05.03.2022.
//

import Foundation

protocol SingleStructure {

    associatedtype Key
    associatedtype Element

    func contains(_ key: Key) -> Bool
    subscript(_ key: Key) -> Element { get }

}

protocol DoubledStructure
where GenericKey == FirstStructure.Key, GenericKey == SecondStructure.Key,
      Content.Element == FirstStructure.Element, Content.Tile == SecondStructure.Element {

    associatedtype FirstStructure: SingleStructure
    associatedtype SecondStructure: SingleStructure

    associatedtype GenericKey: ChainDetectorModule.Key
    associatedtype Content: ChainDetectorModule.CellContainer

}

struct SomeBoard<InnerStructure: DoubledStructure>: ChainDetectorModule.Searchable {

    public typealias Structure = InnerStructure

    private(set) var elements: InnerStructure.FirstStructure
    private(set) var mask: InnerStructure.SecondStructure

    subscript(index: Structure.GenericKey) -> Structure.Content {
        let element = elements[index]
        let tile    = mask[index]
        return CellContent(element: element, tile: tile)
    }

    func contains(_ key: Structure.GenericKey) -> Bool {
        mask.contains(key) && elements.contains(key)
    }

}

