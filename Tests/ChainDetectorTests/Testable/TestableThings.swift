@_exported import ChainDetector
@_exported import MathKit

struct TestableThings {

    private init() {}

}

typealias TheMatrix<T> = MathKit.Matrix<T>
typealias TheElement = SomeElement
typealias TheTile = SomeTile
typealias TheBoardCell<E, T> = CellContainer<E, T> where E: ChainDetectorModule.Element, T: ChainDetectorModule.Tile
typealias TheBoard<C> = SomeBoard<C> where C: CellContainerRequirement//, I: ChainDetectorModule.Key

public enum ChainDetectorModule {

    // MARK: - Board
    public typealias Searchable = CDSearchable
    public typealias CellContainer = CDCellContainer

    // MARK: - Combo
    public typealias Combo = CDCombo
    public typealias Echalon = CDEchalon

    // MARK: - Detector
    public typealias ChainDetector = CDChainDetector

    // MARK: - ELEMENT
    public typealias Element = CDElement
    public typealias ElementType = CDElementType

    // MARK: - Structure
    public typealias Axis = CDAxis
    public typealias Direction = CDDirection
    public typealias Step = CDStep

    public typealias Key = CDKey

    // MARK: - Tile
    public typealias Tile = CDTile
    public typealias TileType = CDTileType

}
//  ChainDetectorModule.TileType

enum Common {

    

}
