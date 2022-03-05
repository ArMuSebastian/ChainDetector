//
//  CDCCombo.swift
//  
//
//  Created by Artem Myshkin on 11.09.2021.
//

public protocol CDCCombo
where Echelon: CDCEchalon {

    associatedtype Echelon
    associatedtype Axis: CDCAxis

    typealias Element = Echelon.Element

    var type: Axis { get }
    var elements: [Echelon] { get }

    init(elements: [Echelon], type: Axis)

}
