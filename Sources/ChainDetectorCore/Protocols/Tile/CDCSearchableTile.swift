//
//  CDCSearchableTile.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

public protocol CDCSearchableTile: Hashable {

    associatedtype Kind: CDCSearchableTileType

    var type: Kind { get }

}
