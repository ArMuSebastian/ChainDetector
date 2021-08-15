//
//  File.swift
//  
//
//  Created by Artem Myshkin on 25.07.2021.
//

import Foundation
@testable import ChainDetector
import MatrixKit

extension TestableThings {

    struct BoardPayload {


        typealias Element = Entity
        typealias Tiles = Tile
        typealias Mask = Matrix<Tiles>
        typealias Elements = Matrix<Element?>
        typealias Payload = (elements: Elements, mask: Mask)

        
        private init() {}

        static var h1: Payload {
            
            let types = createTypes([
                [.a, .b, .c, .d],
                [.b, .c, .d, .d],
                [.c, .d, .a, .b],
                [.a, .a, .a, .a]
            ])
            let mask = try! Mask.init(with: types.map { $0.map{ _ in Tiles(type: .init(rawValue: 1)!)} })

            let elements = createElementsMatrix(from: types)
            return (elements, mask)
        }

        static var h2: Payload {
            
            let types = createTypes([
                [.a, .b, .c, .d],
                [.b, .c, .d, .d],
                [.a, .a, .a, .a],
                [.c, .d, .a, .b],
                
            ])
            let mask = try! Mask.init(with: types.map { $0.map{ _ in Tiles(type: .init(rawValue: 1)!)} })

            let elements = createElementsMatrix(from: types)
            return (elements, mask)
        }

        static var h3: Payload {
            
            let types = createTypes([
                [.a, .a, .a, .a],
                [.a, .b, .c, .d],
                [.b, .c, .d, .d],
                [.c, .d, .a, .b],
                
            ])
            let mask = try! Mask.init(with: types.map { $0.map{ _ in Tiles(type: .init(rawValue: 1)!)} })

            let elements = createElementsMatrix(from: types)
            return (elements, mask)
        }


        static var v1: Payload {
            
            let types = createTypes([
                [.a, .b, .c, .d],
                [.b, .c, .d, .d],
                [.c, .d, .a, .d],
                [.a, .b, .c, .d]
            ])
            let mask = try! Mask.init(with: types.map { $0.map{ _ in Tiles(type: .init(rawValue: 1)!)} })

            let elements = createElementsMatrix(from: types)
            return (elements, mask)
        }

        static var v2: Payload {
            
            let types = createTypes([
                [.a, .b, .d, .c],
                [.b, .c, .d, .d],
                [.c, .d, .d, .a],
                [.a, .b, .d, .c]
                
            ])
            let mask = try! Mask.init(with: types.map { $0.map{ _ in Tiles(type: .init(rawValue: 1)!)} })

            let elements = createElementsMatrix(from: types)
            return (elements, mask)
        }

        static var v3: Payload {
            
            let types = createTypes([
                [ .d, .a, .b, .c],
                [ .d, .b, .c, .d],
                [ .d, .c, .d, .a],
                [ .d, .a, .b, .c]
                
            ])
            let mask = try! Mask.init(with: types.map { $0.map{ _ in Tiles(type: .init(rawValue: 1)!)} })

            let elements = createElementsMatrix(from: types)
            return (elements, mask)
        }

        static var d1: Payload {

            let types = createTypes([
                [ .d, .a, .b, .c],
                [ .d, .d, .d, .d],
                [ .d, .c, .d, .a],
                [ .d, .a, .b, .c]
                
            ])
            let mask = try! Mask.init(with: types.map { $0.map{ _ in Tiles(type: .init(rawValue: 1)!)} })

            let elements = createElementsMatrix(from: types)
            return (elements, mask)
        }

    }

}

extension TestableThings.BoardPayload {

    typealias ElementKind = Element.Kind
    private typealias ElementTypesArray = [[ElementKind]]
    private typealias MatrixOfElements = Matrix<Element?>
    
    static
    private func createTypes(_ types: [[ElementKind]]) -> ElementTypesArray {
        return types
    }

    static
    private func createElementsMatrix(from types: ElementTypesArray) -> MatrixOfElements {
        return try! Elements.init(with: types.map { $0.map(Element.init(type:)) })
    }

}
