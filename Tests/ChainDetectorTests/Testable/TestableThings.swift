@_exported import ChainDetector
@_exported import MathKit

struct TestableThings {

    private init() {}

}

extension TheMatrix: SingleStructure {

    func contains(_ key: Index) -> Bool {
        size.contains(key)
    }

}

struct DoubledStruct<Cell: ChainDetectorModule.CellContainer>: DoubledStructure
{

    typealias FirstStructure = TheMatrix<Cell.Element>
    typealias SecondStructure = TheMatrix<Cell.Tile>
    typealias GenericKey = Index
    typealias Content = Cell

}

typealias DoubleStruct = DoubledStruct<TheBoardCell<TheElement, TheTile>>
typealias TheMatrix<T> = MathKit.Matrix<T>
typealias TheElement = SomeElement
typealias TheTile = SomeTile
typealias TheBoardCell<E, T> = CellContainer<E, T> where E: ChainDetectorModule.Element, T: ChainDetectorModule.Tile
typealias TheBoard<S> = SomeBoard<S> where S: DoubledStructure

public enum ChainDetectorModule {

    public typealias Detector = ChainDetector.Module
    public typealias Core = Detector.Core

    // MARK: - Board
    public typealias Searchable = Core.CDSearchable
    public typealias CellContainer = Core.CDCellContainer

    // MARK: - Combo
    public typealias Combination = Core.CDCombination
    public typealias Echalon = Core.CDEchalon

    // MARK: - ELEMENT
    public typealias Element = Core.CDElement
    public typealias ElementType = Core.CDElementType

    // MARK: - Structure
    public typealias Axis = Core.CDAxis
    public typealias Direction = Core.CDDirection
    public typealias Step = Core.CDStep

    public typealias Key = Core.CDKey

    // MARK: - Tile
    public typealias Tile = Core.CDTile
    public typealias TileType = Core.CDTileType

}
