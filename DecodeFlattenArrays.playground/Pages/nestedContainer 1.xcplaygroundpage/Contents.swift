import Foundation

struct MyStruct: Decodable {
    var category0Subcategories: [String] = []
    var category1Subcategories: [String] = []
    
    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: CodingKeysArray.self, forKey: .data)
        let subcategoryDataArray = try dataContainer.decode([SubcategoryData].self, forKey: .dataArray)
        
        for subcategoryData in subcategoryDataArray {
            if subcategoryData.category_id == 0 {
                category0Subcategories.append(contentsOf: subcategoryData.subcategories)
            } else if subcategoryData.category_id == 1 {
                category1Subcategories.append(contentsOf: subcategoryData.subcategories)
            }
        }
    }
    
    private struct SubcategoryData: Decodable {
        let category_id: Int
        let subcategories: [String]
    }
    
    private enum CodingKeys: String, CodingKey {
        case data
    }
    
    private enum CodingKeysArray: String, CodingKey {
        case dataArray = "data"
    }
}

let jsonString = """
{
  "data": [
    {
      "category_id": 0,
      "subcategories": ["string1", "string2"]
    },
    {
      "category_id": 1,
      "subcategories": ["string3"]
    },
    {
      "category_id": 0,
      "subcategories": ["string4"]
    }
  ]
}
"""

if let jsonData = jsonString.data(using: .utf8) {
    do {
        let myStruct = try JSONDecoder().decode(MyStruct.self, from: jsonData)
        print("Category 0 Subcategories: \(myStruct.category0Subcategories)")
        print("Category 1 Subcategories: \(myStruct.category1Subcategories)")
    } catch {
        print("Error decoding JSON: \(error)")
    }
}
