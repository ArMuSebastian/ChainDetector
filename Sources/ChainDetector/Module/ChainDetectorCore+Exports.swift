//
//  ChainDetectorCore+Exports.swift
//  
//
//  Created by Artem Myshkin on 05.03.2022.
//

import ChainDetectorCore

public enum ChainDetectorCoreModule {

    // MARK: - Board
    public typealias CDSearchable = CDCSearchable
    public typealias CDCellContainer = CDCCellContainer

    // MARK: - Combo
    public typealias CDCombination = CDCCombination
    public typealias CDEchalon = CDCEchalon

    // MARK: - Detector
    public typealias CDChainDetector = CDCChainDetector

    // MARK: - ELEMENT
    public typealias CDElement = CDCElement
    public typealias CDElementType = CDCElementType

    // MARK: - Structure
    public typealias CDAxis = CDCAxis
    public typealias CDDirection = CDCDirection
    public typealias CDStep = CDCStep

    public typealias CDKey = CDCKey

    // MARK: - Tile
    public typealias CDTile = CDCTile
    public typealias CDTileType = CDCTileType

}
