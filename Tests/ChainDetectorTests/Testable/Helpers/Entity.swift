//
//  Entity.swift
//  
//
//  Created by Artem Myshkin on 22.07.2021.
//

import protocol ChainDetector.SearchableElement
import protocol ChainDetector.SearchableElementType

struct Entity: SearchableElement {

    var type: `Type`
}

extension Entity {

    enum `Type`: SearchableElementType {

        case a
        case b
        case c
        case d

    }
    
}
