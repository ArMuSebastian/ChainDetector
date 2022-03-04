extension TestableThings.Board {

    struct Payload {

        typealias ElementsMatrix = TheMatrix<TheElement>
        typealias TileMatrix = TheMatrix<TheTile>

        let elements: ElementsMatrix
        let mask: TileMatrix

        private init(
            elements: ElementsMatrix,
            mask: TileMatrix
        ) {
            self.elements = elements
            self.mask = mask
        }

        static var h1: Self {

            let types = createTypes(
                [
                    [.a, .b, .c, .d],
                    [.b, .c, .d, .d],
                    [.c, .d, .a, .b],
                    [.a, .a, .a, .a]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMaskMatrix(.fromSize(elements.size))
            return Self.init(elements: elements, mask: mask)
        }

        static var h2: Self {

            let types = createTypes(
                [
                    [.a, .b, .c, .d],
                    [.b, .c, .d, .d],
                    [.a, .a, .a, .a],
                    [.c, .d, .a, .b],
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMaskMatrix(.fromSize(elements.size))
            return Self.init(elements: elements, mask: mask)
        }

        static var h3: Self {

            let types = createTypes(
                [
                    [.a, .a, .a, .a],
                    [.a, .b, .c, .d],
                    [.b, .c, .d, .d],
                    [.c, .d, .a, .b],
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMaskMatrix(.fromSize(elements.size))
            return Self.init(elements: elements, mask: mask)
        }


        static var v1: Self {

            let types = createTypes(
                [
                    [.a, .b, .c, .d],
                    [.b, .c, .d, .d],
                    [.c, .d, .a, .d],
                    [.a, .b, .c, .d]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMaskMatrix(.fromSize(elements.size))
            return Self.init(elements: elements, mask: mask)
        }

        static var v2: Self {

            let types = createTypes(
                [
                    [.a, .b, .d, .c],
                    [.b, .c, .d, .d],
                    [.c, .d, .d, .a],
                    [.a, .b, .d, .c]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMaskMatrix(.fromSize(elements.size))
            return Self.init(elements: elements, mask: mask)
        }

        static var v3: Self {

            let types = createTypes(
                [
                    [ .d, .a, .b, .c],
                    [ .d, .b, .c, .d],
                    [ .d, .c, .d, .a],
                    [ .d, .a, .b, .c]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMaskMatrix(.fromSize(elements.size))
            return Self.init(elements: elements, mask: mask)
        }

        static var d1: Self {

            let types = createTypes(
                [
                    [ .d, .a, .b, .c],
                    [ .d, .d, .d, .d],
                    [ .d, .c, .d, .a],
                    [ .d, .a, .b, .c]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMaskMatrix(.fromSize(elements.size))
            return Self.init(elements: elements, mask: mask)
        }

        static var d2: Self {

            let types = createTypes(
                [
                    [ .d, .a, .d, .d],
                    [ .d, .d, .d, .d],
                    [ .d, .c, .d, .d],
                    [ .d, .a, .d, .c]
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMaskMatrix(.fromSize(elements.size))
            return Self.init(elements: elements, mask: mask)
        }

        static var hole1: Self {

            let types = createTypes(
                [
                    [.a, .b, .c, .d],
                    [.a, .a, .a, .a],
                    [.b, .c, .d, .d],
                    [.c, .d, .a, .b],
                ]
            )

            let elements = createElementsMatrix(from: types)
            let mask = createMaskMatrix(.some(
                [
                    [.normal, .normal, .normal, .normal],
                    [.normal, .hole,   .normal, .normal],
                    [.normal, .normal, .normal, .normal],
                    [.normal, .normal, .normal, .normal],
                ]
            ))
            return Self.init(elements: elements, mask: mask)
        }

    }

}

extension TestableThings.Board.Payload {

    private enum MaskCreation {
        case some([[TileMatrix.Element.Kind]])
        case fromSize(MathKit.Size)
    }

    static
    private func createTypes(_ types: [[ElementsMatrix.Element.Kind]]) -> [[ElementsMatrix.Element.Kind]] {

        return types
    }

    static
    private func createElementsMatrix(from types: [[ElementsMatrix.Element.Kind]]) -> ElementsMatrix {
        return matrix(content: types.map { $0.map(ElementsMatrix.Element.init(type:)) })
    }

    static
    private func createMaskMatrix(_ creation: MaskCreation) -> TileMatrix {
        switch creation {
        case .fromSize(let size):
            let tiles = (0..<size.columns).map { _ in
                return (0..<size.rows).map { _ in return TileMatrix.Element(type: TileMatrix.Element.Kind.normal) }
            }
            return matrix(content: tiles)
        case .some(let types):
            return matrix(content: types.map { $0.map { TileMatrix.Element.init(type: $0) } } )
        }
    }

    static
    private func matrix<T>(content: [[T]]) -> Matrix<T> {
        return Matrix(with: content)
    }

}
