//
//  CDSearchableElementType.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

public protocol CDSearchableElement: Hashable {

    associatedtype Kind: CDSearchableElementType

    var type: Kind { get }

}
