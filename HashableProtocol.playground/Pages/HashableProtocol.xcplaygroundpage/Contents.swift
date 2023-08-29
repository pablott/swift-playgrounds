// https://stackoverflow.com/questions/74067657/type-any-protocol-cannot-conform-to-hashable

protocol Stuff: Hashable {
    associatedtype SubcategoryType: RawRepresentable where SubcategoryType.RawValue: StringProtocol
    var identifier: SubcategoryType { get set }
}

struct StuffA: Stuff {
//    typealias SubcategoryType = TopSubcategoryType    // not needed?
    
    enum TopSubcategoryType: String {
        case tshirt = "t-shirt/cut sew"
        case shirt = "shirt"
        case business = "business shirt"
    }
    
    var identifier: TopSubcategoryType
}

struct StuffB: Stuff {
//    typealias SubcategoryType = BottomSubcategoryType // not needed?

    enum BottomSubcategoryType: String {
        case pants = "pants"
        case denim = "denim pants"
        case cargo = "cargo pants"
    }
    
    var identifier: BottomSubcategoryType
}

var arrayOfStuff: Array<any Stuff> = []
arrayOfStuff.append(StuffA(identifier: .tshirt))
arrayOfStuff.append(StuffB(identifier: .cargo))
type(of: arrayOfStuff[0])
type(of: arrayOfStuff[1])
let itemA = arrayOfStuff[0] //as! StuffA
itemA.identifier
let itemB = arrayOfStuff[1] //as! StuffB
itemB.identifier


