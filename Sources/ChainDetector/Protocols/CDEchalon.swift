//
//  CDEchalon.swift
//  
//
//  Created by Artem Myshkin on 11.09.2021.
//

import Foundation

public protocol CDEchalon: Hashable {

    associatedtype Position
    associatedtype Element

    var element: Element { get }
    var position: Position { get }

    init(element: Element, position: Position)

}
