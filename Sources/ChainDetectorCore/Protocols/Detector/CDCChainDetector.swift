//
//  CDCChainDetector.swift
//  
//
//  Created by Artem Myshkin on 05.03.2022.
//

public protocol CDCChainDetector {

    static
    func detectChains<Element, Tile, Input, Combo>(
        from index: Input.Key,
        on input: Input
    ) -> [Combo]
    where Combo: CDCCombination,
          Input: CDCSearchable,
          Input.Element == Element,
          Input.Tile == Tile,
          Input.Element == Combo.Echelon.Element,
          Input.Key.Axis == Combo.Axis,
          Input.Key == Combo.Echelon.Key


}
