//
//  CDCChainDetector.swift
//  
//
//  Created by Artem Myshkin on 05.03.2022.
//

import Foundation

public protocol CDCChainDetector {

    typealias Position = CDCIndex

    func detectChains<Element, Tile, Input, Combo: CDCCombo>(
        from index: Position,
        on input: Input
    ) -> [Combo]
    where Input: CDCSearchable,
          Input.Element == Element, Input.Tile == Tile,
          Input.Element == Combo.Echelon.Element,
          Combo.Echelon.Position == Position

}
