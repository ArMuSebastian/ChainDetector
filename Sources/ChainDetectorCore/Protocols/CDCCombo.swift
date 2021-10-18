//
//  CDCCombo.swift
//  
//
//  Created by Artem Myshkin on 11.09.2021.
//

import enum MathKit.Axis

public protocol CDCCombo where Echelon: CDCEchalon {

    associatedtype Echelon
    associatedtype Element

    var type: Axis { get }
    var elements: [Echelon] { get }

    init(elements: [Echelon], type: Axis)

}
