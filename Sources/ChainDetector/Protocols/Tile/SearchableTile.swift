//
//  SearchableTile.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

public protocol SearchableTile: Hashable {

    associatedtype Kind: SearchableTileType

    var type: Kind { get }

}
