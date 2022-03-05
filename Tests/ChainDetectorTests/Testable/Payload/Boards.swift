extension TestableThings {

    struct Board {

        private init() {}

        static func from(
            payload: Self.Payload
        ) -> TheBoard<TheBoardCell<Payload.ElementsMatrix.Element, Payload.TileMatrix.Element>> {
            return create(from: payload)
        }

    }

}

extension TestableThings.Board {

    static func create<Element: ChainDetectorModule.Element, Tile: ChainDetectorModule.Tile>(
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
