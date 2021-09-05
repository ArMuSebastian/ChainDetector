//
//  SearchableTile.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

public protocol CDSearchableTile: Hashable {

    associatedtype Kind: CDSearchableTileType

    var type: Kind { get }

}
