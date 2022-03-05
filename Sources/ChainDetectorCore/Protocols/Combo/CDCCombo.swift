//
//  CDCCombination.swift
//  
//
//  Created by Artem Myshkin on 11.09.2021.
//

public protocol CDCCombination {

    associatedtype Echelon: CDCEchalon
    associatedtype Axis: CDCAxis

    typealias Element = Echelon.Element

    var type: Axis { get }
    var elements: [Echelon] { get }

    init(elements: [Echelon], type: Axis)

}
