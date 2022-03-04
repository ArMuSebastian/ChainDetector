struct SomeElement: CDSearchableElement {

    var type: `Type`

}

extension SomeElement {

    enum `Type`: CDSearchableElementType {

        case a
        case b
        case c
        case d

    }
    
}
