//
//  ChainDetector.swift
//
//
//  Created by Artem Myshkin on 18.07.2021.
//

import struct MatrixKit.Index

open class ChainDetector {

    typealias Search = Axis
    public typealias Position = MatrixKit.Index

    private var checkedIndices: ChekingMask = .init()
    
    // Find matches in direction
    public func detectChains<Element, Tile, Input: Searchable>(
        from index: Position,
        on board: Input
    ) -> [Chain<Element>]
    where Input.Element == Element, Input.Tile == Tile {

        return performSearch(from: index,
                             on: board)
    }

    private func performSearch<Element, Tile, Input: Searchable>(
        from startingIndex: Position,
        on board: Input
    ) -> [Chain<Element>]
    where Input.Element == Element, Input.Tile == Tile {

        guard checkedIndices.shouldBeChecked(at: startingIndex),
              let search = checkedIndices.search(for: startingIndex) else {
            return []
        }
        

        guard let chain = findChain(search: search, from: startingIndex, on: board) else {

            checkedIndices.consider(check: search, at: startingIndex)

            return performSearch(from: startingIndex, on: board)
        }
        
        checkedIndices.consider(check: search, at: chain.elements.map { $0.position })

        let subc = chain.elements
            .map { performSearch(from: $0.position, on: board) }
            .compactMap{ $0 }
            .flatMap { $0 }

        return [chain] + subc
    }

    // searches for all elements of seartain type in some axis from some index
    // with natural ordering
    private func findChain<Element, Tile, Input: Searchable>(
        search: Search,
        from startingIndex: Position,
        on board: Input
    ) -> Chain<Input.Element>?
    where Input.Element == Element, Input.Tile == Tile {

        guard board.size.contains(startingIndex),
              board.mask[startingIndex].type != .hole else {
            return nil
        }

        let element = board.elements[startingIndex]!
        let accomodation = Accommodation(element: element, position: startingIndex)
        let directions = search.directions

        let firstAccommodation = collectElements(in: directions.first,
                                                 from: startingIndex,
                                                 with: element.type,
                                                 on: board).reversed()

        let secondAccommodation = collectElements(in: directions.second,
                                                  from: startingIndex,
                                                  with: element.type,
                                                  on: board)

        let accommodation = firstAccommodation + [accomodation] + secondAccommodation

        return createChain(from: accommodation, search: search)
    }

    // Collect all element of the same type in some direction
    private func collectElements<Element, Tile, Input: Searchable>(
        in direction: Search.Direction,
        from startingIndex: Position,
        with type: Input.Element.Kind,
        on matrix: Input
    ) -> [Accommodation<Input.Element>]
    where Input.Element == Element, Input.Tile == Tile {

        var accomodations = [Accommodation<Element>]()

        var searchingIndex = startingIndex + direction.delta

        searchingLoop: while matrix.size.contains(searchingIndex),
                             matrix.mask[searchingIndex].type != .hole {

            let element = matrix.elements[searchingIndex]!

            guard element.type == type else { break searchingLoop }

            accomodations.append(.init(element: element, position: searchingIndex))

            searchingIndex = searchingIndex + direction.delta

        }

        return accomodations
    }

}

extension ChainDetector {

    private func createChain<Element: SearchableElement>(
        from searchResult: [Accommodation<Element>],
        search: Search
    ) -> Chain<Element>? {

        if searchResult.count > 2 {
            switch search {
            case .horisontal:
                return .init(elements: searchResult,
                             type: .horisontal)
            case .vertical:
                return .init(elements: searchResult,
                             type: .vertical)
            }
        }

        return nil
    }

}
