extension TestableThings {

    struct Board {

        typealias Struct = DoubleStruct

        private init() {}

        static func from(
            payload: Self.Payload
        ) -> TheBoard<Struct> {
            return create(from: payload)
        }

    }

}

extension TestableThings.Board {

    static func create<Struct: DoubledStructure>(
        from entityMatrix: Struct.FirstStructure,
        and tileMatrix: Struct.SecondStructure
    ) -> TheBoard<Struct> {
        
        TheBoard.init(elements: entityMatrix, mask: tileMatrix)
    }

    static func create(
        from payload: Self.Payload
    ) -> TheBoard<Struct>
    {
        self.create(from: payload.elements, and: payload.mask)
    }

}
