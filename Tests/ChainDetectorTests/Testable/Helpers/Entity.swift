//
//  Entity.swift
//  
//
//  Created by Artem Myshkin on 22.07.2021.
//

import protocol ChainDetector.CDSearchableElement
import protocol ChainDetector.CDSearchableElementType

struct Entity: CDSearchableElement {

    var type: `Type`
}

extension Entity {

    enum `Type`: CDSearchableElementType {

        case a
        case b
        case c
        case d

    }
    
}
