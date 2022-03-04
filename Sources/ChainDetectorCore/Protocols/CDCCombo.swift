//
//  CDCCombo.swift
//  
//
//  Created by Artem Myshkin on 11.09.2021.
//


public protocol CDCCombo where Echelon: CDCEchalon {

    associatedtype Echelon
    associatedtype Element

    var type: CDCAxis { get }
    var elements: [Echelon] { get }

    init(elements: [Echelon], type: CDCAxis)

}
