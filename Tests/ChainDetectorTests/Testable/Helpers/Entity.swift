struct SomeElement: ChainDetectorModule.Element {

    var type: `Type`

}

extension SomeElement {

    enum `Type`: ChainDetectorModule.ElementType {

        case a
        case b
        case c
        case d

    }

}
