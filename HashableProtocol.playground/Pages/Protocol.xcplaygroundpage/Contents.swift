// ChatGPT
// Prompt: I need a data structure designed to accommodate the following. I need a Subcategory type, this is the basis for TopSubcategory and BottomSubcategory. Subcategory defines a variable var type: SubcategoryType. SubcategoryType is a type or protocol like this: RawRepresentable where SubcategoryType.RawValue: StringProtocol  This is because I need variable 'type' to be able to be redefined in BottomSubcategory and TopSubcategory, for instance for TopSubcategory:     enum TopSubcategoryType: String {
//        case tshirt = "t-shirt/cut sew"
//        case shirt = "shirt"
//        case business = "business shirt"
//    }
//
//    var type: TopSubcategoryType
//
//And for BottomSubcategory:
//    enum BottomSubcategoryType: String {
//        case pants = "pants"
//        case denim = "denim pants"
//        case cargo = "cargo pants"
//    }
//
//    var type: BottomSubcategoryType  Question: How can I achieve this relationship in Swift? You can use typealiases, protocols, class, structs and generics, or nay other thing you need.

import Foundation

// Define the SubcategoryType protocol
protocol SubcategoryType: RawRepresentable where RawValue: StringProtocol {}

// Define the Subcategory protocol with associated type
protocol Subcategory {
    associatedtype CategoryType: SubcategoryType
    var type: CategoryType { get }
}

// Define TopSubcategory conforming to Subcategory
struct TopSubcategory: Subcategory {
    // Define the TopSubcategoryType enum
    enum TopSubcategoryType: String, SubcategoryType {
        case tshirt = "t-shirt/cut sew"
        case shirt = "shirt"
        case business = "business shirt"
    }
    
    typealias CategoryType = TopSubcategoryType
    var type: TopSubcategoryType
}

// Define BottomSubcategory conforming to Subcategory
struct BottomSubcategory: Subcategory {
    // Define the BottomSubcategoryType enum
    enum BottomSubcategoryType: String, SubcategoryType {
        case pants = "pants"
        case denim = "denim pants"
        case cargo = "cargo pants"
    }
    
    typealias CategoryType = BottomSubcategoryType
    var type: BottomSubcategoryType
}

// Example usage
let topCategory = TopSubcategory(type: .shirt)
let bottomCategory = BottomSubcategory(type: .pants)

print(topCategory.type.rawValue)    // Output: t-shirt/cut sew
print(bottomCategory.type.rawValue) // Output: pants


var arrayOfStuff: Array<any Subcategory> = []
arrayOfStuff.append(topCategory)
arrayOfStuff.append(bottomCategory)
arrayOfStuff[0].type.rawValue
arrayOfStuff[1].type.rawValue

for item in arrayOfStuff {
    print(item.type.rawValue)
}
