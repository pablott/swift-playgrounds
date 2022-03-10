import Foundation

func decodeFromJsonString<ResponseType: Decodable>(
    JSONstring: String,
    responseType: ResponseType.Type
) -> ResponseType? {
    guard let data = JSONstring.data(using: .utf8) else { return nil }
    let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    do {
        let decodedObject = try decoder.decode(ResponseType.self, from: data)
        print("Decoded object: \(decodedObject)")
        return decodedObject
    } catch {
        print("Failed to decode JSON data: \(error)")
        return nil
    }
    return nil
}

let workingString = """
{
    "name": "shirt",
    "size": "S"
}
"""

//decodeFromJsonString(JSONstring: jsonString2, responseType: Goods.self)
jsonString2.data(using: .utf8)


struct Goods: Codable {
    let goodsId: Int
    let name: String
    let partNumber: String
    let description: String
    let madeIn: String
    let material: String
    let goodsDetailId: Int
    let price: Decimal
    let colorId: Int
    let colorName: Color
    let sizeId: Int
    let sizeName: Size
    let sizeDetails: [GoodsSizeDetails]
    let imageUrl: String
    let imageUrls: [ImageURL]
    let hasStock: Bool
    let stockLeft: Int
    let categoryId: Int
    let categoryName: String
    let brandName: String
    let typeId: Int
    let typeName: String
}

enum Color: Int, Codable {
    case black
    case white
    case gray
    case cyan
    case red

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        switch try container.decode(String.self) {
        case "BLACK": self = .black
        case "WHITE": self = .white
        case "GRAY": self = .gray
        case "CYAN": self = .cyan
        case "RED": self = .red

        default: self = .black
        }
    }
}

enum Size: String, Codable {
    case small = "S"
    case medium = "M"
    case large = "L"

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        switch try container.decode(String.self) {
        case "S",
             "SMALL":
            self = .small
        case "M",
             "MEDIUM":
            self = .medium
        case "L",
             "LARGE":
            self = .large
    
        default: self = .medium
        }
    }
}

struct GoodsSizeDetails: Codable {
    let name: String
    let value: Double
}

struct ImageURL: Codable {
    let url: String
    let sortNum: Int
}

let jsonString1 = """
  {
    "goods_id": 52846237,
    "name": "オーバーサイズロングガウンコート",
    "part_number": "13HS-USA03(i)",
    "description": "商品説明文が入ります。テキストテキスト",
    "made_in": "USA",
    "material": "コットン100%",
    "goods_detail_id": 12548046,
    "price": 6500,
    "color_id": 1,
    "color_name": "ホワイト",
    "size_id": 37,
    "size_name": "L",
    "size_details": [
      {
        "name": "肩幅",
        "value": 38.5
      }
    ],
    "image_url": "http://img5.zozo.jp/goodsimages/419/4502419/4502419_1_D_500.jpg",
    "image_urls": [
      {
        "url": "肩幅",
        "sort_num": 1
      }
    ],
    "has_stock": true,
    "stock_left": 15,
    "category_id": 2001,
    "category_name": "Tシャツ/カットソー",
    "brand_name": "Nike",
    "type_id": 101,
    "type_name": "Tシャツ/カットソー"
  }
"""

let jsonString2 = """
{
"goods_id": 52846237,
"name": "abc",
"part_number": "13HS-USA03(i)",
"description": "abc",
"made_in": "USA",
"material": "abc",
"goods_detail_id": 12548046,
"price": 6500,
"color_id": 1,
"color_name": "abc",
"size_id": 37,
"size_name": "L",
"size_details": [
  {
    "name": "肩幅",
    "value": 38.5
  }
],
"image_url": "http://img5.zozo.jp/goodsimages/419/4502419/4502419_1_D_500.jpg",
"image_urls": [
  {
    "url": "肩幅",
    "sort_num": 1
  }
],
"has_stock": true,
"stock_left": 15,
"category_id": 2001,
"category_name": "Size",
"brand_name": "Nike",
"type_id": 101,
"type_name": "Size"
}
"""

let jsonString3 = """
[
  {
    "goods_id": 1,
    "name": "コーチジャケット",
    "part_number": "A6103-122ZP010191",
    "description": "【デザイン】全体的にゆとりを入れたバギーシルエットを構築。袖はシャツタイプの袖採用。シャツのように軽く着られるデザインに。フロンのドットボタンは細かい間隔でスタイリングに合わせ開きを楽しんでください。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 1,
    "price": 15000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "着丈",
        "value": "69"
      },
      {
        "name": "身幅",
        "value": "115"
      },
      {
        "name": "裄丈",
        "value": "83.5"
      },
      {
        "name": "裾巾",
        "value": "115"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/TY162WR.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2261,
    "type_name": "ナイロンジャケット"
  },
  {
    "goods_id": 1,
    "name": "コーチジャケット",
    "part_number": "A6103-122ZP010192",
    "description": "【デザイン】全体的にゆとりを入れたバギーシルエットを構築。袖はシャツタイプの袖採用。シャツのように軽く着られるデザインに。フロンのドットボタンは細かい間隔でスタイリングに合わせ開きを楽しんでください。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 2,
    "price": 15000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "着丈",
        "value": "71"
      },
      {
        "name": "身幅",
        "value": "119"
      },
      {
        "name": "裄丈",
        "value": "85.5"
      },
      {
        "name": "裾巾",
        "value": "119"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/TY162WR.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2261,
    "type_name": "ナイロンジャケット"
  },
  {
    "goods_id": 1,
    "name": "コーチジャケット",
    "part_number": "A6103-122ZP010193",
    "description": "【デザイン】全体的にゆとりを入れたバギーシルエットを構築。袖はシャツタイプの袖採用。シャツのように軽く着られるデザインに。フロンのドットボタンは細かい間隔でスタイリングに合わせ開きを楽しんでください。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 3,
    "price": 15000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "着丈",
        "value": "73"
      },
      {
        "name": "身幅",
        "value": "123"
      },
      {
        "name": "裄丈",
        "value": "87"
      },
      {
        "name": "裾巾",
        "value": "123"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/TY162WR.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2261,
    "type_name": "ナイロンジャケット"
  },
  {
    "goods_id": 2,
    "name": "ノーカラージャケット",
    "part_number": "A6103-122ZP020191",
    "description": "【デザイン】ミリタリー要素を入れた4ポケットカーディガンブルゾン。シャツ合わせでもパーカー合わせでもシーンに合わせて万能スタイリングアイテムです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 4,
    "price": 12000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "着丈",
        "value": "66"
      },
      {
        "name": "身幅",
        "value": "115"
      },
      {
        "name": "裄丈",
        "value": "81"
      },
      {
        "name": "裾巾",
        "value": "110"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/5600.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2262,
    "type_name": "ノーカラージャケット"
  },
  {
    "goods_id": 2,
    "name": "ノーカラージャケット",
    "part_number": "A6103-122ZP020192",
    "description": "【デザイン】ミリタリー要素を入れた4ポケットカーディガンブルゾン。シャツ合わせでもパーカー合わせでもシーンに合わせて万能スタイリングアイテムです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 5,
    "price": 12000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "着丈",
        "value": "68"
      },
      {
        "name": "身幅",
        "value": "119"
      },
      {
        "name": "裄丈",
        "value": "82.5"
      },
      {
        "name": "裾巾",
        "value": "114"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/5600.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2262,
    "type_name": "ノーカラージャケット"
  },
  {
    "goods_id": 2,
    "name": "ノーカラージャケット",
    "part_number": "A6103-122ZP020193",
    "description": "【デザイン】ミリタリー要素を入れた4ポケットカーディガンブルゾン。シャツ合わせでもパーカー合わせでもシーンに合わせて万能スタイリングアイテムです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 6,
    "price": 12000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "着丈",
        "value": "70"
      },
      {
        "name": "身幅",
        "value": "123"
      },
      {
        "name": "裄丈",
        "value": "84.5"
      },
      {
        "name": "裾巾",
        "value": "118"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/5600.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2262,
    "type_name": "ノーカラージャケット"
  },
  {
    "goods_id": 3,
    "name": "アーバンステンコート",
    "part_number": "A6103-135ZA010191",
    "description": "【デザイン】オーバーサイズ仕上げステンカラーコート。袖にボリュームを持たせポケットに入れた時の袖の溜まり具合が良いです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 7,
    "price": 18000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "着丈",
        "value": "66"
      },
      {
        "name": "身幅",
        "value": "122"
      },
      {
        "name": "裄丈",
        "value": "84.5"
      },
      {
        "name": "裾巾",
        "value": "146"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/C01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/B02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/C01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/TY162WR.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2214,
    "type_name": "ステンカラーコート"
  },
  {
    "goods_id": 3,
    "name": "アーバンステンコート",
    "part_number": "A6103-135ZA010192",
    "description": "【デザイン】オーバーサイズ仕上げステンカラーコート。袖にボリュームを持たせポケットに入れた時の袖の溜まり具合が良いです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 8,
    "price": 18000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "着丈",
        "value": "107"
      },
      {
        "name": "身幅",
        "value": "126"
      },
      {
        "name": "裄丈",
        "value": "86.5"
      },
      {
        "name": "裾巾",
        "value": "150"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/C01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/C01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/C01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/TY162WR.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2214,
    "type_name": "ステンカラーコート"
  },
  {
    "goods_id": 3,
    "name": "アーバンステンコート",
    "part_number": "A6103-135ZA010193",
    "description": "【デザイン】オーバーサイズ仕上げステンカラーコート。袖にボリュームを持たせポケットに入れた時の袖の溜まり具合が良いです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 9,
    "price": 18000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "着丈",
        "value": "110"
      },
      {
        "name": "身幅",
        "value": "130"
      },
      {
        "name": "裄丈",
        "value": "88"
      },
      {
        "name": "裾巾",
        "value": "154"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/C01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/C01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/C01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/TY162WR.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2214,
    "type_name": "ステンカラーコート"
  },
  {
    "goods_id": 4,
    "name": "Tシャツ",
    "part_number": "A6103-211ZC010191",
    "description": "【デザイン】衿腰を少し高く重ね着でも衿がのぞくスタイリングアクセントのあるレギュラーシルエットTシャツ。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 10,
    "price": 6000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "着丈",
        "value": "68"
      },
      {
        "name": "身幅",
        "value": "104"
      },
      {
        "name": "裄丈",
        "value": "47"
      },
      {
        "name": "裾巾",
        "value": "100"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/TY162WR.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2001,
    "type_name": "Tシャツ/カットソー"
  },
  {
    "goods_id": 4,
    "name": "Tシャツ",
    "part_number": "A6103-211ZC010192",
    "description": "【デザイン】衿腰を少し高く重ね着でも衿がのぞくスタイリングアクセントのあるレギュラーシルエットTシャツ。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 11,
    "price": 6000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "着丈",
        "value": "70"
      },
      {
        "name": "身幅",
        "value": "110"
      },
      {
        "name": "裄丈",
        "value": "49"
      },
      {
        "name": "裾巾",
        "value": "106"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/TY162WR.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2001,
    "type_name": "Tシャツ/カットソー"
  },
  {
    "goods_id": 4,
    "name": "Tシャツ",
    "part_number": "A6103-211ZC010193",
    "description": "【デザイン】衿腰を少し高く重ね着でも衿がのぞくスタイリングアクセントのあるレギュラーシルエットTシャツ。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 12,
    "price": 6000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "着丈",
        "value": "72"
      },
      {
        "name": "身幅",
        "value": "116"
      },
      {
        "name": "裄丈",
        "value": "51"
      },
      {
        "name": "裾巾",
        "value": "112"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/TY162WR.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2001,
    "type_name": "Tシャツ/カットソー"
  },
  {
    "goods_id": 5,
    "name": "ヘビーロングTシャツ",
    "part_number": "A6103-211ZC020191",
    "description": "【デザイン】コーディネートを選ばずに使い勝手良くスタイリング合わせしやすいラグラン袖クルーロングスリーブTシャツ。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 13,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "着丈",
        "value": "67"
      },
      {
        "name": "身幅",
        "value": "108"
      },
      {
        "name": "裄丈",
        "value": "82"
      },
      {
        "name": "裾巾",
        "value": "86.5"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/27-9900.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2001,
    "type_name": "Tシャツ/カットソー"
  },
  {
    "goods_id": 5,
    "name": "ヘビーロングTシャツ",
    "part_number": "A6103-211ZC020192",
    "description": "【デザイン】コーディネートを選ばずに使い勝手良くスタイリング合わせしやすいラグラン袖クルーロングスリーブTシャツ。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 14,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "着丈",
        "value": "69"
      },
      {
        "name": "身幅",
        "value": "114"
      },
      {
        "name": "裄丈",
        "value": "84"
      },
      {
        "name": "裾巾",
        "value": "92.5"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/27-9900.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2001,
    "type_name": "Tシャツ/カットソー"
  },
  {
    "goods_id": 5,
    "name": "ヘビーロングTシャツ",
    "part_number": "A6103-211ZC020193",
    "description": "【デザイン】コーディネートを選ばずに使い勝手良くスタイリング合わせしやすいラグラン袖クルーロングスリーブTシャツ。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 15,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "着丈",
        "value": "71"
      },
      {
        "name": "身幅",
        "value": "120"
      },
      {
        "name": "裄丈",
        "value": "86"
      },
      {
        "name": "裾巾",
        "value": "98.5"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/27-9900.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2001,
    "type_name": "Tシャツ/カットソー"
  },
  {
    "goods_id": 6,
    "name": "フーディスウェット",
    "part_number": "A6103-213ZC030191",
    "description": "【デザイン】コーディネートを選ばずに使い勝手良くスタイリング合わせでもフードの立体的な立ち具合と裾についたスピンドルでシルエットな幅出しできる万能パーカーです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 16,
    "price": 9000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "着丈",
        "value": "70"
      },
      {
        "name": "身幅",
        "value": "111"
      },
      {
        "name": "裄丈",
        "value": "82"
      },
      {
        "name": "裾巾",
        "value": "104"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I03_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I03_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I03_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/27-9900.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2021,
    "type_name": "パーカー"
  },
  {
    "goods_id": 6,
    "name": "フーディスウェット",
    "part_number": "A6103-213ZC030192",
    "description": "【デザイン】コーディネートを選ばずに使い勝手良くスタイリング合わせでもフードの立体的な立ち具合と裾についたスピンドルでシルエットな幅出しできる万能パーカーです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 17,
    "price": 9000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "着丈",
        "value": "72"
      },
      {
        "name": "身幅",
        "value": "117"
      },
      {
        "name": "裄丈",
        "value": "84"
      },
      {
        "name": "裾巾",
        "value": "110"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I03_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I03_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I03_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/27-9900.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2021,
    "type_name": "パーカー"
  },
  {
    "goods_id": 6,
    "name": "フーディスウェット",
    "part_number": "A6103-213ZC030193",
    "description": "【デザイン】コーディネートを選ばずに使い勝手良くスタイリング合わせでもフードの立体的な立ち具合と裾についたスピンドルでシルエットな幅出しできる万能パーカーです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 18,
    "price": 9000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "着丈",
        "value": "74"
      },
      {
        "name": "身幅",
        "value": "123"
      },
      {
        "name": "裄丈",
        "value": "86"
      },
      {
        "name": "裾巾",
        "value": "116"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I03_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I03_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I03_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/27-9900.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2021,
    "type_name": "パーカー"
  },
  {
    "goods_id": 7,
    "name": "Tシャツ",
    "part_number": "A6103-211ZC040191",
    "description": "【デザイン】衿腰を少し高く重ね着でも衿がのぞくスタイリングアクセントのあるリラックスシルエットTシャツ。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 19,
    "price": 6000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "着丈",
        "value": "70"
      },
      {
        "name": "身幅",
        "value": "106"
      },
      {
        "name": "裄丈",
        "value": "51"
      },
      {
        "name": "裾巾",
        "value": "102"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I04_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I04_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I04_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2001,
    "type_name": "Tシャツ/カットソー"
  },
  {
    "goods_id": 7,
    "name": "Tシャツ",
    "part_number": "A6103-211ZC040192",
    "description": "【デザイン】衿腰を少し高く重ね着でも衿がのぞくスタイリングアクセントのあるリラックスシルエットTシャツ。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 20,
    "price": 6000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "着丈",
        "value": "72"
      },
      {
        "name": "身幅",
        "value": "112"
      },
      {
        "name": "裄丈",
        "value": "53"
      },
      {
        "name": "裾巾",
        "value": "108"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I04_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I04_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I04_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2001,
    "type_name": "Tシャツ/カットソー"
  },
  {
    "goods_id": 7,
    "name": "Tシャツ",
    "part_number": "A6103-211ZC040193",
    "description": "【デザイン】衿腰を少し高く重ね着でも衿がのぞくスタイリングアクセントのあるリラックスシルエットTシャツ。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 21,
    "price": 6000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "着丈",
        "value": "74"
      },
      {
        "name": "身幅",
        "value": "118"
      },
      {
        "name": "裄丈",
        "value": "55"
      },
      {
        "name": "裾巾",
        "value": "114"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I04_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I04_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/I04_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2001,
    "type_name": "Tシャツ/カットソー"
  },
  {
    "goods_id": 8,
    "name": "ジャストルーズジャケット",
    "part_number": "A6103-120ZR030191",
    "description": "【デザイン】リラックス感あるルーズシルエットと無駄のないシンプルデザインジャケット。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 22,
    "price": 14000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "着丈",
        "value": "69"
      },
      {
        "name": "身幅",
        "value": "115"
      },
      {
        "name": "裄丈",
        "value": "81.5"
      },
      {
        "name": "裾巾",
        "value": "125"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/J01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/J01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/J01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2021,
    "type_name": "パーカー"
  },
  {
    "goods_id": 8,
    "name": "ジャストルーズジャケット",
    "part_number": "A6103-120ZR030192",
    "description": "【デザイン】リラックス感あるルーズシルエットと無駄のないシンプルデザインジャケット。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 23,
    "price": 14000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "着丈",
        "value": "71"
      },
      {
        "name": "身幅",
        "value": "119"
      },
      {
        "name": "裄丈",
        "value": "83"
      },
      {
        "name": "裾巾",
        "value": "129"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/J01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/J01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/J01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2021,
    "type_name": "パーカー"
  },
  {
    "goods_id": 8,
    "name": "ジャストルーズジャケット",
    "part_number": "A6103-120ZR030193",
    "description": "【デザイン】リラックス感あるルーズシルエットと無駄のないシンプルデザインジャケット。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 24,
    "price": 14000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "着丈",
        "value": "73"
      },
      {
        "name": "身幅",
        "value": "123"
      },
      {
        "name": "裄丈",
        "value": "85"
      },
      {
        "name": "裾巾",
        "value": "133"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/J01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/J01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/J01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 108,
    "category_name": "ジャケット/アウター",
    "brand_name": "ALTRM",
    "type_id": 2021,
    "type_name": "パーカー"
  },
  {
    "goods_id": 9,
    "name": "ジャストルーズパンツ",
    "part_number": "A6103-153ZS010191",
    "description": "【デザイン】腰と太ももにゆとりを持たせ裾にかけてきれいな2タックテーパードパンツ。スピンドルが両面出し可能でカジュアル見えのアクセントになります。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 25,
    "price": 9000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "74"
      },
      {
        "name": "渡り",
        "value": "34.4"
      },
      {
        "name": "股上",
        "value": "28"
      },
      {
        "name": "股下",
        "value": "65"
      },
      {
        "name": "裾巾",
        "value": "19.5"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 112,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2348,
    "type_name": "チノパンツ"
  },
  {
    "goods_id": 9,
    "name": "ジャストルーズパンツ",
    "part_number": "A6103-153ZS010192",
    "description": "【デザイン】腰と太ももにゆとりを持たせ裾にかけてきれいな2タックテーパードパンツ。スピンドルが両面出し可能でカジュアル見えのアクセントになります。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 26,
    "price": 9000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "78"
      },
      {
        "name": "渡り",
        "value": "35.7"
      },
      {
        "name": "股上",
        "value": "28.5"
      },
      {
        "name": "股下",
        "value": "67"
      },
      {
        "name": "裾巾",
        "value": "20"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 112,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2348,
    "type_name": "チノパンツ"
  },
  {
    "goods_id": 9,
    "name": "ジャストルーズパンツ",
    "part_number": "A6103-153ZS010193",
    "description": "【デザイン】腰と太ももにゆとりを持たせ裾にかけてきれいな2タックテーパードパンツ。スピンドルが両面出し可能でカジュアル見えのアクセントになります。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 27,
    "price": 9000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "82"
      },
      {
        "name": "渡り",
        "value": "37"
      },
      {
        "name": "股上",
        "value": "29"
      },
      {
        "name": "股下",
        "value": "69"
      },
      {
        "name": "裾巾",
        "value": "20.5"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 112,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2348,
    "type_name": "チノパンツ"
  },
  {
    "goods_id": 10,
    "name": "ボードショーツ",
    "part_number": "A6103-153ZS020191",
    "description": "【デザイン】膝上レングスでスタイリングに嵌りやすいボードショーツ。バックポケットはフラップ付き。キャンプアウトドアシーンにもぴったりです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 28,
    "price": 7000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "70"
      },
      {
        "name": "渡り",
        "value": "34"
      },
      {
        "name": "股上",
        "value": "24.5"
      },
      {
        "name": "股下",
        "value": "22"
      },
      {
        "name": "裾巾",
        "value": "28.5"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 104,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2013,
    "type_name": "ショーツ"
  },
  {
    "goods_id": 10,
    "name": "ボードショーツ",
    "part_number": "A6103-153ZS020192",
    "description": "【デザイン】膝上レングスでスタイリングに嵌りやすいボードショーツ。バックポケットはフラップ付き。キャンプアウトドアシーンにもぴったりです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 29,
    "price": 7000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "74"
      },
      {
        "name": "渡り",
        "value": "35"
      },
      {
        "name": "股上",
        "value": "25"
      },
      {
        "name": "股下",
        "value": "23"
      },
      {
        "name": "裾巾",
        "value": "29.5"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 104,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2013,
    "type_name": "ショーツ"
  },
  {
    "goods_id": 10,
    "name": "ボードショーツ",
    "part_number": "A6103-153ZS020193",
    "description": "【デザイン】膝上レングスでスタイリングに嵌りやすいボードショーツ。バックポケットはフラップ付き。キャンプアウトドアシーンにもぴったりです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 30,
    "price": 7000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "78"
      },
      {
        "name": "渡り",
        "value": "36.5"
      },
      {
        "name": "股上",
        "value": "25.5"
      },
      {
        "name": "股下",
        "value": "24"
      },
      {
        "name": "裾巾",
        "value": "30.5"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/FF1641.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 104,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2013,
    "type_name": "ショーツ"
  },
  {
    "goods_id": 11,
    "name": "シェフパンツ",
    "part_number": "A6103-153ZS030191",
    "description": "【デザイン】ゆったりとしたテーパードシルエットと抜群の動きやすさと体形に関係なく着用できる楽な履き心地です。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 31,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "70"
      },
      {
        "name": "渡り",
        "value": "34.4"
      },
      {
        "name": "股上",
        "value": "29.5"
      },
      {
        "name": "股下",
        "value": "66"
      },
      {
        "name": "裾巾",
        "value": "20"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P03_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P03_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P03_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/MRST910EA-HSD.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 112,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2040,
    "type_name": "その他パンツ"
  },
  {
    "goods_id": 11,
    "name": "シェフパンツ",
    "part_number": "A6103-153ZS030192",
    "description": "【デザイン】ゆったりとしたテーパードシルエットと抜群の動きやすさと体形に関係なく着用できる楽な履き心地です。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 32,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "74"
      },
      {
        "name": "渡り",
        "value": "35.7"
      },
      {
        "name": "股上",
        "value": "30"
      },
      {
        "name": "股下",
        "value": "68"
      },
      {
        "name": "裾巾",
        "value": "20.5"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P03_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P03_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P03_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/MRST910EA-HSD.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 112,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2040,
    "type_name": "その他パンツ"
  },
  {
    "goods_id": 11,
    "name": "シェフパンツ",
    "part_number": "A6103-153ZS030193",
    "description": "【デザイン】ゆったりとしたテーパードシルエットと抜群の動きやすさと体形に関係なく着用できる楽な履き心地です。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 33,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "78"
      },
      {
        "name": "渡り",
        "value": "37"
      },
      {
        "name": "股上",
        "value": "30.5"
      },
      {
        "name": "股下",
        "value": "70"
      },
      {
        "name": "裾巾",
        "value": "21"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P03_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P03_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P03_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/MRST910EA-HSD.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 112,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2040,
    "type_name": "その他パンツ"
  },
  {
    "goods_id": 12,
    "name": "スリム５Pパンツ",
    "part_number": "A6103-153ZS040191",
    "description": "【デザイン】ベーシックな5ポケットデザイン。レギュラーシルエットでややテーパードさせたきれいなシルエットです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 34,
    "price": 9000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "74"
      },
      {
        "name": "渡り",
        "value": "28.4"
      },
      {
        "name": "股上",
        "value": "25"
      },
      {
        "name": "股下",
        "value": "66"
      },
      {
        "name": "裾巾",
        "value": "17"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P04_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P04_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P04_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/MRST910EA-HSD.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 112,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2040,
    "type_name": "その他パンツ"
  },
  {
    "goods_id": 12,
    "name": "スリム５Pパンツ",
    "part_number": "A6103-153ZS040192",
    "description": "【デザイン】ベーシックな5ポケットデザイン。レギュラーシルエットでややテーパードさせたきれいなシルエットです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 35,
    "price": 9000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "78"
      },
      {
        "name": "渡り",
        "value": "29.7"
      },
      {
        "name": "股上",
        "value": "25.5"
      },
      {
        "name": "股下",
        "value": "68"
      },
      {
        "name": "裾巾",
        "value": "17.5"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P04_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P04_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P04_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/MRST910EA-HSD.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 112,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2040,
    "type_name": "その他パンツ"
  },
  {
    "goods_id": 12,
    "name": "スリム５Pパンツ",
    "part_number": "A6103-153ZS040193",
    "description": "【デザイン】ベーシックな5ポケットデザイン。レギュラーシルエットでややテーパードさせたきれいなシルエットです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 36,
    "price": 9000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "ウエスト",
        "value": "82"
      },
      {
        "name": "渡り",
        "value": "31"
      },
      {
        "name": "股上",
        "value": "26"
      },
      {
        "name": "股下",
        "value": "70"
      },
      {
        "name": "裾巾",
        "value": "18"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P04_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P04_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/P04_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/MRST910EA-HSD.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 112,
    "category_name": "パンツ",
    "brand_name": "ALTRM",
    "type_id": 2040,
    "type_name": "その他パンツ"
  },
  {
    "goods_id": 13,
    "name": "ジャストルーズシャツ",
    "part_number": "A6103-110ZW010191",
    "description": "【デザイン】程よくゆとりを持ったシルエットで裾がスリット入りスクエアカットでシャツの上でも気合わせ出来るアウター感覚のシャツになります。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 37,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "着丈",
        "value": "66"
      },
      {
        "name": "身幅",
        "value": "112"
      },
      {
        "name": "裄丈",
        "value": "82.5"
      },
      {
        "name": "裾巾",
        "value": "108"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/85-6008SY.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2004,
    "type_name": "シャツ/ブラウス"
  },
  {
    "goods_id": 13,
    "name": "ジャストルーズシャツ",
    "part_number": "A6103-110ZW010192",
    "description": "【デザイン】程よくゆとりを持ったシルエットで裾がスリット入りスクエアカットでシャツの上でも気合わせ出来るアウター感覚のシャツになります。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 38,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "着丈",
        "value": "68"
      },
      {
        "name": "身幅",
        "value": "116"
      },
      {
        "name": "裄丈",
        "value": "84.5"
      },
      {
        "name": "裾巾",
        "value": "112"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/85-6008SY.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2004,
    "type_name": "シャツ/ブラウス"
  },
  {
    "goods_id": 13,
    "name": "ジャストルーズシャツ",
    "part_number": "A6103-110ZW010193",
    "description": "【デザイン】程よくゆとりを持ったシルエットで裾がスリット入りスクエアカットでシャツの上でも気合わせ出来るアウター感覚のシャツになります。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 39,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "着丈",
        "value": "70"
      },
      {
        "name": "身幅",
        "value": "120"
      },
      {
        "name": "裄丈",
        "value": "86"
      },
      {
        "name": "裾巾",
        "value": "116"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S01_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S01_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S01_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/85-6008SY.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2004,
    "type_name": "シャツ/ブラウス"
  },
  {
    "goods_id": 14,
    "name": "L/Sシャツ",
    "part_number": "A6103-110ZW020191",
    "description": "【デザイン】ジャストルーズな定番シャツ。胸のポケットは両身頃に有りワークトレンドを入れ込んだディテールです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 40,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 2,
    "size_name": "S",
    "size_details": [
      {
        "name": "着丈",
        "value": "75"
      },
      {
        "name": "身幅",
        "value": "112"
      },
      {
        "name": "裄丈",
        "value": "83.5"
      },
      {
        "name": "裾巾",
        "value": "106"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/85-6008SY.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2004,
    "type_name": "シャツ/ブラウス"
  },
  {
    "goods_id": 14,
    "name": "L/Sシャツ",
    "part_number": "A6103-110ZW020192",
    "description": "【デザイン】ジャストルーズな定番シャツ。胸のポケットは両身頃に有りワークトレンドを入れ込んだディテールです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 41,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 3,
    "size_name": "M",
    "size_details": [
      {
        "name": "着丈",
        "value": "77"
      },
      {
        "name": "身幅",
        "value": "116"
      },
      {
        "name": "裄丈",
        "value": "85.5"
      },
      {
        "name": "裾巾",
        "value": "110"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/85-6008SY.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2004,
    "type_name": "シャツ/ブラウス"
  },
  {
    "goods_id": 14,
    "name": "L/Sシャツ",
    "part_number": "A6103-110ZW020193",
    "description": "【デザイン】ジャストルーズな定番シャツ。胸のポケットは両身頃に有りワークトレンドを入れ込んだディテールです。",
    "made_in": "中国",
    "material": "",
    "goods_detail_id": 42,
    "price": 8000,
    "color_id": 8,
    "color_name": "ブラック",
    "size_id": 4,
    "size_name": "L",
    "size_details": [
      {
        "name": "着丈",
        "value": "79"
      },
      {
        "name": "身幅",
        "value": "120"
      },
      {
        "name": "裄丈",
        "value": "87"
      },
      {
        "name": "裾巾",
        "value": "114"
      }
    ],
    "image_url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S02_front.JPG",
    "image_urls": [
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S02_front.JPG",
        "sort_num": 1
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/S02_back.JPG",
        "sort_num": 2
      },
      {
        "url": "https://virtualfitting-test.s3.ap-northeast-1.amazonaws.com/altrm/85-6008SY.png",
        "sort_num": 3
      }
    ],
    "has_stock": true,
    "stock_left": 0,
    "category_id": 101,
    "category_name": "トップス",
    "brand_name": "ALTRM",
    "type_id": 2004,
    "type_name": "シャツ/ブラウス"
  }
]
"""
