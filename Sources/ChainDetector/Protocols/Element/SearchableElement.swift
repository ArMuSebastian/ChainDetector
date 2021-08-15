//
//  SearchableElement.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

public protocol SearchableElement: Hashable {

    associatedtype Kind: SearchableElementType

    var type: Kind { get }

}
