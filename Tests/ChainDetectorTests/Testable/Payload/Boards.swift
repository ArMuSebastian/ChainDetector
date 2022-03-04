extension TestableThings {

    struct Board {

        private init() {}

        static var h1 = Board.create(from: Self.Payload.h1)
        static var h2 = Board.create(from: Self.Payload.h2)
        static var h3 = Board.create(from: Self.Payload.h3)


        static var v1 = Board.create(from: Self.Payload.v1)
        static var v2 = Board.create(from: Self.Payload.v2)
        static var v3 = Board.create(from: Self.Payload.v3)


        static var d1 = Board.create(from: Self.Payload.d1)
        static var d2 = Board.create(from: Self.Payload.d2)


        static var o2 = Board.create(from: Self.Payload.hole1)

    }

}

extension TestableThings.Board {

    static func create<Element: CDSearchableElement, Tile: CDSearchableTile>(
        from entityMatrix: TheMatrix<Element>,
        and tileMatrix: TheMatrix<Tile>
    ) -> TheBoard<TheBoardCell<Element, Tile>> {
        
        TheBoard.init(elements: entityMatrix, mask: tileMatrix)
    }

    static func create(
        from payload: Self.Payload
    ) -> TheBoard<TheBoardCell<Self.Payload.ElementsMatrix.Element, Self.Payload.TileMatrix.Element>>
    {
        self.create(from: payload.elements, and: payload.mask)
    }

}
