//
//  CDCTile.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

public protocol CDCTile: Hashable {

    associatedtype Kind: CDCTileType

    var type: Kind { get }

}
