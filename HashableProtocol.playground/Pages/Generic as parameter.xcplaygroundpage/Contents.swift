protocol SubcategoryType: RawRepresentable, Hashable where RawValue: StringProtocol {}

enum TopSubcategoryType: String, SubcategoryType {
    case tshirt = "t-shirt/cut sew"
    case shirt = "shirt"
    case business = "business shirt"
}

enum BottomSubcategoryType: String, SubcategoryType {
    case pants = "pants"
    case denim = "denim pants"
    case cargo = "cargo pants"
}

// typealias CategoryType = SubcategoryType & Hashable
struct Subcategory<T: SubcategoryType> {
    let type: [T]
}

let top = Subcategory(type: [TopSubcategoryType.shirt, TopSubcategoryType.business])
let bottom = Subcategory(type: [BottomSubcategoryType.cargo])
var array: [Subcategory<TopSubcategoryType>] = []
array.append(top)
array.append(bottom)

for part in array {
    for item in part.type {
        print(item.rawValue)
    }
}
