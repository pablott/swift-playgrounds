//
//  Prefecture.swift
//  VirtualFitting
//
//  Created by bruno.bertolucci on 2021/07/13.
//

import Foundation

/// 都道府県名
internal enum PrefectureName: Int, CaseIterable {
//     swiftlint:disable identifier_name
    case 北海道
    case 青森県
    case 岩手県
    case 宮城県
    case 秋田県
    case 山形県
    case 福島県
    case 茨城県
    case 栃木県
    case 群馬県
    case 埼玉県
    case 千葉県
    case 東京都
    case 神奈川県
    case 新潟県
    case 富山県
    case 石川県
    case 福井県
    case 山梨県
    case 長野県
    case 岐阜県
    case 静岡県
    case 愛知県
    case 三重県
    case 滋賀県
    case 京都府
    case 大阪府
    case 兵庫県
    case 奈良県
    case 和歌山県
    case 鳥取県
    case 島根県
    case 岡山県
    case 広島県
    case 山口県
    case 徳島県
    case 香川県
    case 愛媛県
    case 高知県
    case 福岡県
    case 佐賀県
    case 長崎県
    case 熊本県
    case 大分県
    case 宮崎県
    case 鹿児島県
    case 沖縄県
    // swiftlint:enable identifier_name
    
    var name: String { String(describing: self) }
    
    init?(name: String) {
        let prefectureMatch = Self.allCases.first { $0.name == name }
        guard let prefecture = prefectureMatch else { return nil }
        self.init(rawValue: prefecture.rawValue)
    }
}

/// 都道府県
public enum Prefecture: Int {
    case hokkaido = 1
    case aomori
    case iwate
    case miyagi
    case akita
    case yamagata
    case fukushima
    case ibaraki
    case tochigi
    case gunma
    case saitama
    case chiba
    case tokyo
    case kanagawa
    case niigata
    case toyama
    case ishikawa
    case fukui
    case yamanashi
    case nagano
    case gifu
    case shizuoka
    case aichi
    case mie
    case shiga
    case kyoto
    case osaka
    case hyogo
    case nara
    case wakayama
    case tottori
    case shimane
    case okayama
    case hiroshima
    case yamaguchi
    case tokushima
    case kagawa
    case ehime
    case kochi
    case fukuoka
    case saga
    case nagasaki
    case kumamoto
    case oita
    case miyazaki
    case kagoshima
    case okinawa
}

// MARK: - Intializers & computed properties

public extension Prefecture {
    /// 都道府県コードで初期化
    init?(code: Int) {
        self.init(rawValue: code)
    }

    /// 都道府県名で初期化
    init?(name: String) {
        guard let prefectureNameIndex = PrefectureName(name: name)?.rawValue else { return nil }
        self.init(code: prefectureNameIndex + 1)
    }

    /// 都道府県コード
    var code: Int {
        rawValue
    }

    /// 都道府県名
    var name: String? {
        PrefectureName(rawValue: rawValue - 1)?.name ?? "該当なし"
    }

    static func allValues() -> [String] {
        PrefectureName.allCases.map(\.name)
    }
}


Prefecture.allValues()
Prefecture.allValues().count

let prefectureByCode = Prefecture(code: 1)
prefectureByCode?.name
prefectureByCode?.code


let prefectureByName = Prefecture(name: "青森県")
prefectureByName?.name
prefectureByName?.code
