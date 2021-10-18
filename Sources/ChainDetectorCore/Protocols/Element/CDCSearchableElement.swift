//
//  CDCSearchableElement.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

public protocol CDCSearchableElement: Hashable {

    associatedtype Kind: CDCSearchableElementType

    var type: Kind { get }

}
