
import Foundation

// MARK: - Decoder

func decodeFromJsonString<ResponseType: Decodable>(
    JSONstring: String,
    responseType: ResponseType.Type
) -> ResponseType? {
    print(JSONstring)

    guard let data = JSONstring.data(using: .utf8) else { return nil }
    
    let decoder = JSONDecoder()
    //    decoder.keyDecodingStrategy = .convertFromSnakeCase
    do {
        let decodedObject = try decoder.decode(ResponseType.self, from: data)
        print("Decoded object: \(decodedObject)")
        return decodedObject
    } catch {
        print("Failed to decode JSON data: \(error)")
        return nil
    }
}

// MARK: - Struct

struct Item: Codable {
    var name: String
    var size: Size
}

enum Size: String, Codable {
    case small
    case medium = "myMediumSize"
    case large
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        switch try container.decode(String.self) {
        case "S",
             "small",
             "SMALL":
            // add any other value here
            self = .small
        case "M": self = .medium
        case "L": self = .large

        default: fatalError()
        }
    }
    
    // If you don't need any custom encoding, just use a basic 'encode' implementation:
    func encode(to encoder: Encoder) throws {}
}

let jsonData1 = """
{
    "name": "shirt",
    "size": "S"
}
"""
let jsonData2 = """
{
    "name": "shirt",
    "size": "small"
}
"""

let jsonString3 = """
    [
        {"id": 10},
        {"id": 20}
    ]
"""

let jsonData3 = """
{
    "name": "shirt",
    "size": "SMALL"
}
"""


// MARK: - Decode

let item1 = decodeFromJsonString(JSONstring: jsonData1, responseType: Item.self)
let item2 = decodeFromJsonString(JSONstring: jsonData2, responseType: Item.self)
let item3 = decodeFromJsonString(JSONstring: jsonData3, responseType: Item.self)

item1?.size
item2?.size
item3?.size

item1?.size == item2?.size
item1?.size == item3?.size


// MARK: RawValue

item1?.size.rawValue
item2?.size.rawValue
item3?.size.rawValue


// MARK: RawValue with a custom String

let jsonData4 = """
{
    "name": "shirt",
    "size": "M"
}
"""

let item4 = decodeFromJsonString(JSONstring: jsonData4, responseType: Item.self)
item4?.size.rawValue


