//
//  CDCElement.swift
//  
//
//  Created by Artem Myshkin on 15.08.2021.
//

public protocol CDCElement: Hashable {

    associatedtype Kind: CDCElementType

    var type: Kind { get }

}
