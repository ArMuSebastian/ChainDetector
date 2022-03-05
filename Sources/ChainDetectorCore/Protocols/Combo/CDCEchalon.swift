//
//  CDEchalon.swift
//  
//
//  Created by Artem Myshkin on 11.09.2021.
//

public protocol CDCEchalon: Hashable {

    associatedtype Key: CDCKey
    associatedtype Element

    var element: Element { get }
    var key: Key { get }

    init(element: Element, key: Key)

}
