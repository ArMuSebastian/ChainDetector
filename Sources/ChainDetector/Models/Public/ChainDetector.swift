//
//  ClassicChainDetector.swift
//
//
//  Created by Artem Myshkin on 18.07.2021.
//

public class ClassicChainDetector: Module.Core.CDChainDetector {

    public typealias SearchaRequirement         = Module.Core.CDSearchable
    public typealias CombinationRequirement     = Module.Core.CDCombination
    public typealias EchalonRequirement         = Module.Core.CDEchalon
    public typealias ElementRequirement         = Module.Core.CDElement
    internal typealias Mask                     = ChekingMask

    internal required init() {}

    // Find matches in direction
    static
    public func detectChains<Element, Tile, Input, Combo>(
        from index: Input.Key,
        on input: Input
    ) -> [Combo]
    where Combo: CombinationRequirement,
          Input: SearchaRequirement,
          Input.Element == Element,
          Input.Tile == Tile,
          Input.Element == Combo.Echelon.Element,
          Input.Key.Axis == Combo.Axis,
          Input.Key == Combo.Echelon.Key
    {
        let chainDetector = Self()
        var checkedIndices: Mask<Input.Key> = .init()
        return chainDetector.performSearch(
            from: index,
            on: input,
            with: &checkedIndices
        )
    }

    private func performSearch<Element, Tile, Input, Combo>(
        from startingIndex: Input.Key,
        on input: Input,
        with checkedIndices: inout ChekingMask<Input.Key>
    ) -> [Combo]
    where Combo: CombinationRequirement,
          Input: SearchaRequirement,
          Input.Element == Element,
          Input.Tile == Tile,
          Input.Element == Combo.Echelon.Element,
          Input.Key.Axis == Combo.Axis,
          Input.Key == Combo.Echelon.Key
    {

        guard checkedIndices.shouldBeChecked(at: startingIndex),
              let search: Input.Key.Axis = checkedIndices.search(for: startingIndex)
        else {
            return []
        }

        guard let chain: Combo = findChain(search: search, from: startingIndex, on: input)
        else {
            checkedIndices.consider(check: search, at: startingIndex)
            return performSearch(from: startingIndex, on: input, with: &checkedIndices)
        }

        checkedIndices.consider(check: search, at: chain.elements.map(\.key))

        let subc: [Combo] = chain.elements
            .map { (echalon: Combo.Echelon) -> [Combo] in
                let chains: [Combo] = performSearch(from: echalon.key, on: input, with: &checkedIndices)
                return chains
            }
            .flatMap { $0 }

        return [chain] + subc
    }

    // searches for all elements of seartain type in some axis from some index
    // with natural ordering
    private func findChain<Element, Tile, Input, Combo, Axis>(
        search: Axis,
        from startingIndex: Input.Key,
        on input: Input
    ) -> Combo?
    where Combo: CombinationRequirement,
          Input: SearchaRequirement,
          Input.Element == Element,
          Input.Tile == Tile,
          Input.Element == Combo.Echelon.Element,
          Input.Key.Axis == Combo.Axis,
          Input.Key == Combo.Echelon.Key,
          Combo.Axis == Axis
    {

        guard input.contains(startingIndex),
              input[startingIndex].tile.type != .hole
        else {
            return nil
        }

        let element = input[startingIndex].element!
        let accomodation = Combo.Echelon.init(element: element, key: startingIndex)
        let directions = search.directions

        let firstAccommodation: [Combo.Echelon] = collectElements(
            in: directions.first,
            from: startingIndex,
            with: element.type,
            on: input
        )
            .reversed()

        let secondAccommodation: [Combo.Echelon] = collectElements(
            in: directions.second,
            from: startingIndex,
            with: element.type,
            on: input
        )

        let accommodation = firstAccommodation + [accomodation] + secondAccommodation

        return combo(from: accommodation, search: search)
    }

    // Collect all element of the same type in some direction
    private func collectElements<Element, Tile, Input, Echelon, Axis>(
        in direction: Axis.Direction,
        from startingIndex: Input.Key,
        with type: Input.Element.Kind,
        on input: Input
    ) -> [Echelon]
    where Echelon: EchalonRequirement,
          Input: SearchaRequirement,
          Input.Element == Element,
          Input.Tile == Tile,
          Input.Element == Echelon.Element,
          Input.Key == Echelon.Key,
          Input.Key.Axis == Axis
    {

        var echelon = [Echelon]()

        var searchingIndex = startingIndex.applying(delta: direction.delta)

        searchingLoop: while input.contains(searchingIndex),
                             input[searchingIndex].tile.type != .hole {

            let element = input[searchingIndex].element!

            guard element.type == type else { break searchingLoop }

            echelon.append(.init(element: element, key: searchingIndex))

            searchingIndex = searchingIndex.applying(delta: direction.delta)

        }

        return echelon
    }

    // NOTE Elementt
    private func combo<Element, Combo, Axis>(
        from searchResult: [Combo.Echelon],
        search: Axis
    ) -> Combo?
    where Combo: CombinationRequirement,
          Element: ElementRequirement,
          Combo.Echelon.Element == Element,
          Combo.Axis == Axis
    {

        guard searchResult.count > 2 else { return nil }

        return .init(
            elements: searchResult,
            type: search
        )
    }

}