protocol SubcategoryType: RawRepresentable where RawValue: StringProtocol {}

enum TopSubcategoryType: String, CategoryType {
    case tshirt = "t-shirt/cut sew"
    case shirt = "shirt"
    case business = "business shirt"
}

enum BottomSubcategoryType: String, CategoryType {
    case pants = "pants"
    case denim = "denim pants"
    case cargo = "cargo pants"
}

// TODO: make type Hashable
typealias CategoryType = SubcategoryType
struct Subcategory {
    let type: [any CategoryType]
}

let top = Subcategory(type: [TopSubcategoryType.shirt, TopSubcategoryType.business])
let bottom = Subcategory(type: [BottomSubcategoryType.cargo])
var array: [Subcategory] = []
array.append(top)
array.append(bottom)

for part in array {
    for item in part.type {
        print(item.rawValue)
    }
}
