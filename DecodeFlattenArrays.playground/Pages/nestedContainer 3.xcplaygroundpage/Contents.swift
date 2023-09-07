import Foundation

// MARK: SubcategoryProtocol
protocol SubcategoryProtocol: RawRepresentable, Codable, Hashable, CaseIterable where RawValue: StringProtocol {}

enum TopSubcategory: String, SubcategoryProtocol {
    case tshirt = "t-shirt, cut-sew"
    case shirt = "shirt, blouse"
    case business = "business shirt"
    case polo = "polo shirt"
    case knit = "knit, sweater"
    case hoodie = "hoodie"
    case sweat = "sweat"
    case jersey = "jersey"
    case tank = "tank top"
}

enum BottomSubcategory: String, SubcategoryProtocol {
    case pants = "pants"
    case denim = "denim pants"
    case cargo = "cargo pants"
    case chino = "chino pants"
    case sweat = "sweat pants"
    case slacks = "slacks"
}

// MARK: CategoriesResponse
struct CategoriesResponse: Codable {
    var topSubcategories: [TopSubcategory] = []
    var bottomSubcategories: [BottomSubcategory] = []
    
    private enum CategoryIdentifier: Int, Decodable {
        case tops = 1
        case jacket = 2
        case ensemble = 3
        case pants = 4
        case belt = 5
        case bag = 6
        case scarf = 7
        case shoes = 8
    }
    
    private struct SubcategoryData: Decodable {
        let categoryId: CategoryIdentifier
        let subcategories: [String]
    }
    
    private enum ContainerKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerKeys.self)
        let data = try container.decode([SubcategoryData].self, forKey: .data)
        
        for item in data {
            switch item.category_id {
            case .tops:
                self.topSubcategories = try Self.stringToEnum(
                    type: TopSubcategory.self,
                    stringArray: item.subcategories)
            case .pants:
                self.bottomSubcategories = try Self.stringToEnum(
                    type: BottomSubcategory.self,
                    stringArray: item.subcategories)
            default:
                print("Category", item.category_id, "not decoded")
            }
        }
    }
    
    private static func stringToEnum<T: SubcategoryProtocol>(
        type: T.Type,
        stringArray: [String]) throws -> [T] {
        var objectArray: [T] = []

        for element in stringArray {
            guard let string = element as? T.RawValue,
                let object = T(rawValue: string) else {
                throw DecodingError.dataCorrupted(.init(
                    codingPath: [],
                    debugDescription: "Could not decode entry: \(element), into type: \(T.self)"))
            }
            objectArray.append(object)
        }
        return objectArray
    }
}


// MARK: Demo
let jsonString = """
{
  "data": [
    {
      "category_id": 1,
      "category_name": "Tops",
      "subcategories": [
        "t-shirt, cut-sew",
        "shirt, blouse"
      ]
    },
    {
      "category_id": 4,
      "category_name": "Pants",
      "subcategories": [
        "pants",
        "denim pants"
      ]
    },
    {
      "category_id": 8,
      "category_name": "Shoes",
      "subcategories": [
        "sneakers",
        "slip-on"
      ]
    }
  ]
}
"""

let jsonString2 = """
{
  "data": [
    {
      "category_id": 1,
      "category_name": "Tops",
      "category_name_jp": "トップス",
      "part_ids": [
        4
      ],
      "subcategories": [
        "t-shirt, cut-sew",
        "shirt, blouse",
        "business shirt",
        "polo shirt",
        "knit, sweater",
        "hoodie",
        "sweat",
        "jersey",
        "tank top"
      ],
      "subcategories_jp": [
        "Tシャツ/カットソー",
        "シャツ/ブラウス",
        "ビジネスシャツ",
        "ポロシャツ",
        "ニット/セーター",
        "パーカー",
        "スウェット",
        "ジャージ",
        "タンクトップ"
      ]
    },
    {
      "category_id": 2,
      "category_name": "Jacket/Outer",
      "category_name_jp": "ジャケット/アウター",
      "part_ids": [
        4
      ],
      "subcategories": [
        "none",
        "cardigan",
        "vest",
        "jacket",
        "outer jacket",
        "suit vest",
        "tailored jacket",
        "collarless jacket",
        "collarless coat",
        "denim jacket",
        "riders jacket",
        "blouson",
        "military jacket",
        "ma-1",
        "down jacket",
        "down vest",
        "duffle coat",
        "mods coat",
        "pea coat",
        "trench coat",
        "chester coat",
        "mouton coat",
        "nylon jacket",
        "mountain parka",
        "stadium jumper",
        "poncho"
      ],
      "subcategories_jp": [
        "なし",
        "カーディガン",
        "ベスト",
        "ジャケット",
        "アウタージャケット",
        "スーツベスト",
        "テーラードジャケット",
        "ノーカラージャケット",
        "ノーカラーコート",
        "デニムジャケット",
        "ライダースジャケット",
        "ブルゾン",
        "ミリタリージャケット",
        "MA-1",
        "ダウンジャケット",
        "ダウンベスト",
        "ダッフルコート",
        "モッズコート",
        "ピーコート",
        "トレンチコート",
        "チェスターコート",
        "ムートンコート",
        "ナイロンジャケット",
        "マウンテンパーカー",
        "スタジャン",
        "ポンチョ"
      ]
    },
    {
      "category_id": 3,
      "category_name": "Ensemble",
      "category_name_jp": "アンサンブル",
      "part_ids": [
        4,
        6
      ],
      "subcategories": [
        "salopette",
        "swimsuit",
        "yukata",
        "room wear",
        "suit set",
        "rash guard"
      ],
      "subcategories_jp": [
        "サロペット",
        "水着",
        "浴衣",
        "ルームウェア",
        "スーツセット",
        "ラッシュガード"
      ]
    },
    {
      "category_id": 4,
      "category_name": "Pants",
      "category_name_jp": "パンツ",
      "part_ids": [
        6
      ],
      "subcategories": [
        "pants",
        "denim pants",
        "cargo pants",
        "chino pants",
        "sweat pants",
        "slacks"
      ],
      "subcategories_jp": [
        "パンツ",
        "デニムパンツ",
        "カーゴパンツ",
        "チノパン",
        "スウェットパンツ",
        "スラックス"
      ]
    },
    {
      "category_id": 5,
      "category_name": "Belt",
      "category_name_jp": "ベルト",
      "part_ids": [
        8
      ],
      "subcategories": [
        "none"
      ],
      "subcategories_jp": [
        "なし"
      ]
    },
    {
      "category_id": 6,
      "category_name": "Bag",
      "category_name_jp": "バッグ",
      "part_ids": [
        16
      ],
      "subcategories": [
        "none"
      ],
      "subcategories_jp": [
        "なし"
      ]
    },
    {
      "category_id": 7,
      "category_name": "Scarf",
      "category_name_jp": "スカーフ",
      "part_ids": [
        17
      ],
      "subcategories": [
        "none"
      ],
      "subcategories_jp": [
        "なし"
      ]
    },
    {
      "category_id": 8,
      "category_name": "Shoes",
      "category_name_jp": "シューズ",
      "part_ids": [
        21
      ],
      "subcategories": [
        "sneakers",
        "slip-on",
        "sandal",
        "pumps",
        "boots",
        "dress shoes",
        "loafers",
        "moccasins",
        "rain-shoes"
      ],
      "subcategories_jp": [
        "スニーカー",
        "スリッポン",
        "サンダル",
        "パンプス",
        "ブーツ",
        "ドレスシューズ",
        "ローファー",
        "モカシン",
        "レインシューズ"
      ]
    }
  ]
}
"""

if let jsonData = jsonString2.data(using: .utf8) {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    do {
        let myStruct = try decoder.decode(CategoriesResponse.self, from: jsonData)
        print("Category TOPS Subcategories: \(myStruct.topSubcategories)")
        print("Category PANTS Subcategories: \(myStruct.bottomSubcategories)")
    } catch {
        print("Error decoding JSON: \(error)")
    }
}
