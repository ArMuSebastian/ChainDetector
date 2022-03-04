//
//  ChainDetector.swift
//
//
//  Created by Artem Myshkin on 18.07.2021.
//

import ChainDetectorCore

open class ChainDetector: CDChainDetector {

    public typealias SearchAxis = CDAxis
    public typealias Position = CDIndex
    public typealias Searchable = CDSearchable
    public typealias Combable = CDCombo

    private var checkedIndices: ChekingMask = .init()

    public init() {}

    // Find matches in direction
    public func detectChains<Element, Tile, Input: Searchable, Combo: Combable>(
        from index: Position,
        on input: Input
    ) -> [Combo]
    where Input.Element == Element, Input.Tile == Tile,
          Input.Element == Combo.Echelon.Element,
          Combo.Echelon.Position == Position
    {

        return performSearch(
            from: index,
            on: input
        )
    }

    private func performSearch<Element, Tile, Input: Searchable, Combo: Combable>(
        from startingIndex: Position,
        on input: Input
    ) -> [Combo]
    where Input.Element == Element, Input.Tile == Tile,
          Input.Element == Combo.Echelon.Element,
          Combo.Echelon.Position == Position
    {

        guard checkedIndices.shouldBeChecked(at: startingIndex),
              let search = checkedIndices.search(for: startingIndex)
        else {
            return []
        }

        guard let chain: Combo = findChain(search: search, from: startingIndex, on: input)
        else {
            checkedIndices.consider(check: search, at: startingIndex)
            return performSearch(from: startingIndex, on: input)
        }

        checkedIndices.consider(check: search, at: chain.elements.map { $0.position })

        let subc: [Combo] = chain.elements
            .map { (echalon: Combo.Echelon) -> [Combo] in
                let chains: [Combo] = performSearch(from: echalon.position, on: input)
                return chains
            }
            .flatMap { $0 }

        return [chain] + subc
    }

    // searches for all elements of seartain type in some axis from some index
    // with natural ordering
    private func findChain<Element, Tile, Input: Searchable, Combo: Combable>(
        search: SearchAxis,
        from startingIndex: Position,
        on input: Input
    ) -> Combo?
    where Input.Element == Element, Input.Tile == Tile,
          Input.Element == Combo.Echelon.Element,
          Combo.Echelon.Position == Position
    {

        guard input.size.contains(startingIndex),
              input[startingIndex].tile.type != .hole
        else {
            return nil
        }

        let element = input[startingIndex].element!
        let accomodation = Combo.Echelon.init(element: element, position: startingIndex)
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
    private func collectElements<Element, Tile, Input: Searchable, Echelon: CDEchalon>(
        in direction: SearchAxis.Direction,
        from startingIndex: Position,
        with type: Input.Element.Kind,
        on input: Input
    ) -> [Echelon]
    where Input.Element == Element, Input.Tile == Tile,
          Input.Element == Echelon.Element,
          Echelon.Position == Position
    {

        var echelon = [Echelon]()

        var searchingIndex = startingIndex + direction.delta

        searchingLoop: while input.size.contains(searchingIndex),
                             input[searchingIndex].tile.type != .hole {

            let element = input[searchingIndex].element!

            guard element.type == type else { break searchingLoop }

            echelon.append(.init(element: element, position: searchingIndex))

            searchingIndex = searchingIndex + direction.delta

        }

        return echelon
    }

}

extension ChainDetector {

    private func combo<Element: CDSearchableElement, Combo: Combable>(
        from searchResult: [Combo.Echelon],
        search: SearchAxis
    ) -> Combo?
    where Combo.Echelon.Element == Element
    {

        guard searchResult.count > 2 else { return nil }

        return .init(elements: searchResult,
                     type: search)
    }

}
