@_exported import ChainDetector
@_exported import MathKit

struct TestableThings {

    private init() {}

}

typealias TheMatrix<T> = MathKit.Matrix<T>
typealias TheElement = SomeElement
typealias TheTile = SomeTile
typealias TheBoardCell<E, T> = CellContainer<E, T> where E: CDSearchableElement, T: CDSearchableTile
typealias TheBoard<Cell> = SomeBoard<Cell> where Cell: CellContainerRequirement
