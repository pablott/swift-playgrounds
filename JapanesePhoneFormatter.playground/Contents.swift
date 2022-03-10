// (?:\"(\d+)\" => \d)
// /gm

// Formatter to Swift array
// ^(\d+)(\n)
// "$1",

import Foundation

// 市外局番 , 市内局番の桁数のマップ - Area codes
// http://www.soumu.go.jp/main_sosiki/joho_tsusin/top/tel_number/number_shitei.html のデータを利用
// 固定電話以外の桁数は適当です...

// ORIGINAL IMPLEMENTATION
//# 市外局番長毎のマップを作成する
//5.downto(2) do |i|
//  const_set("MAP_#{i}", MAP.reject { |k, v| k.length != i })
//end
//
//def self.split(tel)
//  # 市外局番の長いものから探していく
//  [MAP_5, MAP_4, MAP_3, MAP_2].each_with_index do |map, index|
//    len = map.first[0].length
//    if map.has_key?(tel[0, len])      - check that the first element matches, example 04992
//      len_2 = map[tel[0, len]] # 市内局番の長さ  - length of the value, for example for 04992 -> 5, this is 5
//      return [tel[0, len], tel[len, len_2], tel[(len + len_2)..-1]]
//    end
//  end
//  # 見つからなかった
//  return [tel, "", ""]
//end
//end




// USING DICTS
// https://stackoverflow.com/a/41509565
// Note: all these cdoes were moved to PrefixCodes

typealias PrefixDict = [String: Int]

struct AreaCodes {
    // 3 digits, 4/3 length
    let threeDigitsGroup: PrefixDict = [
        "050": 4,  // IP電話
        "070": 4,  // 携帯電話/PHS
        "080": 4,  // 携帯電話
        "090": 4,  // 携帯電話
        "020": 3  // その他
    ]
    // 4 digits, 3 length
    let fourDigitsGroup: PrefixDict = [
        "0120": 3, // その他
        "0800": 3, // その他
        "0570": 3, // その他
        "0990": 3  // その他
    ]
}

// 固定電話 - Landline
struct PrefixCodes {
    // Based on number of digits of prefix,
    // it can be determined the length of the sufix
    // (third group is the remaining digits of phone number).
    // Most codes follow the pattern: preffix + suffix = 6
    // Area codes don't follow this pattern,
    // that's why we need to store the suffix length in the dictionary

    // 5 digits prefix, 1 digit suffix
    let fiveDigitsGroup: PrefixDict = [
        "01267": 1, "01372": 1, "01374": 1, "01377": 1, "01392": 1, "01397": 1, "01398": 1, "01456": 1, "01457": 1, "01466": 1, "01547": 1, "01558": 1, "01564": 1, "01586": 1, "01587": 1, "01632": 1, "01634": 1, "01635": 1, "01648": 1, "01654": 1, "01655": 1, "01656": 1, "01658": 1, "04992": 1, "04994": 1, "04996": 1, "04998": 1, "05769": 1, "05979": 1, "07468": 1, "08387": 1, "08388": 1, "08396": 1, "08477": 1, "08512": 1, "08514": 1, "09496": 1, "09802": 1, "09912": 1, "09913": 1, "09969": 1
    ]
    // 4 digits prefix, 2 digits suffix (except area codes)
    var fourDigitsGroup: PrefixDict = [
        "0120": 3, // その他
        "0800": 3, // その他
        "0570": 3, // その他
        "0990": 3,  // その他
        "0123": 2, "0124": 2, "0125": 2, "0126": 2, "0133": 2, "0134": 2, "0135": 2, "0136": 2, "0137": 2, "0138": 2, "0139": 2, "0142": 2, "0143": 2, "0144": 2, "0145": 2, "0146": 2, "0152": 2, "0153": 2, "0154": 2, "0155": 2, "0156": 2, "0157": 2, "0158": 2, "0162": 2, "0163": 2, "0164": 2, "0165": 2, "0166": 2, "0167": 2, "0172": 2, "0173": 2, "0174": 2, "0175": 2, "0176": 2, "0178": 2, "0179": 2, "0182": 2, "0183": 2, "0184": 2, "0185": 2, "0186": 2, "0187": 2, "0191": 2, "0192": 2, "0193": 2, "0194": 2, "0195": 2, "0197": 2, "0198": 2, "0220": 2, "0223": 2, "0224": 2, "0225": 2, "0226": 2, "0228": 2, "0229": 2, "0233": 2, "0234": 2, "0235": 2, "0237": 2, "0238": 2, "0240": 2, "0241": 2, "0242": 2, "0243": 2, "0244": 2, "0246": 2, "0247": 2, "0248": 2, "0250": 2, "0254": 2, "0255": 2, "0256": 2, "0257": 2, "0258": 2, "0259": 2, "0260": 2, "0261": 2, "0263": 2, "0264": 2, "0265": 2, "0266": 2, "0267": 2, "0268": 2, "0269": 2, "0270": 2, "0274": 2, "0276": 2, "0277": 2, "0278": 2, "0279": 2, "0280": 2, "0282": 2, "0283": 2, "0284": 2, "0285": 2, "0287": 2, "0288": 2, "0289": 2, "0291": 2, "0293": 2, "0294": 2, "0295": 2, "0296": 2, "0297": 2, "0299": 2, "0422": 2, "0428": 2, "0436": 2, "0438": 2, "0439": 2, "0460": 2, "0463": 2, "0465": 2, "0466": 2, "0467": 2, "0470": 2, "0475": 2, "0476": 2, "0478": 2, "0479": 2, "0480": 2, "0493": 2, "0494": 2, "0495": 2, "0531": 2, "0532": 2, "0533": 2, "0536": 2, "0537": 2, "0538": 2, "0539": 2, "0544": 2, "0545": 2, "0547": 2, "0548": 2, "0550": 2, "0551": 2, "0553": 2, "0554": 2, "0555": 2, "0556": 2, "0557": 2, "0558": 2, "0561": 2, "0562": 2, "0563": 2, "0564": 2, "0565": 2, "0566": 2, "0567": 2, "0568": 2, "0569": 2, "0572": 2, "0573": 2, "0574": 2, "0575": 2, "0576": 2, "0577": 2, "0578": 2, "0581": 2, "0584": 2, "0585": 2, "0586": 2, "0587": 2, "0594": 2, "0595": 2, "0596": 2, "0597": 2, "0598": 2, "0599": 2, "0721": 2, "0725": 2, "0735": 2, "0736": 2, "0737": 2, "0738": 2, "0739": 2, "0740": 2, "0742": 2, "0743": 2, "0744": 2, "0745": 2, "0746": 2, "0747": 2, "0748": 2, "0749": 2, "0761": 2, "0763": 2, "0765": 2, "0766": 2, "0767": 2, "0768": 2, "0770": 2, "0771": 2, "0772": 2, "0773": 2, "0774": 2, "0776": 2, "0778": 2, "0779": 2, "0790": 2, "0791": 2, "0794": 2, "0795": 2, "0796": 2, "0797": 2, "0798": 2, "0799": 2, "0820": 2, "0823": 2, "0824": 2, "0826": 2, "0827": 2, "0829": 2, "0833": 2, "0834": 2, "0835": 2, "0836": 2, "0837": 2, "0838": 2, "0845": 2, "0846": 2, "0847": 2, "0848": 2, "0852": 2, "0853": 2, "0854": 2, "0855": 2, "0856": 2, "0857": 2, "0858": 2, "0859": 2, "0863": 2, "0865": 2, "0866": 2, "0867": 2, "0868": 2, "0869": 2, "0875": 2, "0877": 2, "0879": 2, "0880": 2, "0883": 2, "0884": 2, "0885": 2, "0887": 2, "0889": 2, "0892": 2, "0893": 2, "0894": 2, "0895": 2, "0896": 2, "0897": 2, "0898": 2, "0920": 2, "0930": 2, "0940": 2, "0942": 2, "0943": 2, "0944": 2, "0946": 2, "0947": 2, "0948": 2, "0949": 2, "0950": 2, "0952": 2, "0954": 2, "0955": 2, "0956": 2, "0957": 2, "0959": 2, "0964": 2, "0965": 2, "0966": 2, "0967": 2, "0968": 2, "0969": 2, "0972": 2, "0973": 2, "0974": 2, "0977": 2, "0978": 2, "0979": 2, "0980": 2, "0982": 2, "0983": 2, "0984": 2, "0985": 2, "0986": 2, "0987": 2, "0993": 2, "0994": 2, "0995": 2, "0996": 2, "0997": 2
        ]
    // 3 digits prefix, 3 digits suffix (except area codes)
    var threeDigitsGroup: PrefixDict = [
        "050": 4,  // IP電話
        "070": 4,  // 携帯電話/PHS
        "080": 4,  // 携帯電話
        "090": 4,  // 携帯電話
        "020": 3,  // その他
        "011": 3, "015": 3, "017": 3, "018": 3, "019": 3, "022": 3, "023": 3, "024": 3, "025": 3, "026": 3, "027": 3, "028": 3, "029": 3, "042": 3, "043": 3, "044": 3, "045": 3, "046": 3, "047": 3, "048": 3, "049": 3, "052": 3, "053": 3, "054": 3, "055": 3, "058": 3, "059": 3, "072": 3, "073": 3, "075": 3, "076": 3, "077": 3, "078": 3, "079": 3, "082": 3, "083": 3, "084": 3, "086": 3, "087": 3, "088": 3, "089": 3, "092": 3, "093": 3, "095": 3, "096": 3, "097": 3, "098": 3, "099": 3
    ]
    // 2 digits prefix, 4 digits suffix
    let twoDigitsGroup: PrefixDict = ["03": 4, "04": 4, "06": 4]
}

// USING ARRAYS
//struct AreaCodes {
//    // Different digits, 4 length
//    let phoneGroup: [String] = [
//        "050",  // IP電話
//        "070",  // 携帯電話/PHS
//        "080",  // 携帯電話
//        "090"   // 携帯電話
//    ]
//    // Different digits, 3 length
//    let otherGroup: [String] = [
//        "020",  // その他
//        "0120", // その他
//        "0800", // その他
//        "0570", // その他
//        "0990"  // その他
//    ]
//}
//
//// 固定電話 - Landline
//struct PrefixCodes {
//    private let areaCodes = AreaCodes()
//    
//    // Based on number of digits of first group,
//    // it can be determined the area code length of the second group
//    // (third group is the remaining digits of phone number)
//
//    // 5 digits, 1 length
//    let fiveDigitsGroup: [String] = [
//        "01267", "01372", "01374", "01377", "01392", "01397", "01398", "01456", "01457", "01466", "01547", "01558", "01564", "01586", "01587", "01632", "01634", "01635", "01648", "01654", "01655", "01656", "01658", "04992", "04994", "04996", "04998", "05769", "05979", "07468", "08387", "08388", "08396", "08477", "08512", "08514", "09496", "09802", "09912", "09913", "09969"
//    ]
//    // 4 digits, 2 length
//    let fourDigitsGroup: [String] = [
//        "0123", "0124", "0125", "0126", "0133", "0134", "0135", "0136", "0137", "0138", "0139", "0142", "0143", "0144", "0145", "0146", "0152", "0153", "0154", "0155", "0156", "0157", "0158", "0162", "0163", "0164", "0165", "0166", "0167", "0172", "0173", "0174", "0175", "0176", "0178", "0179", "0182", "0183", "0184", "0185", "0186", "0187", "0191", "0192", "0193", "0194", "0195", "0197", "0198", "0220", "0223", "0224", "0225", "0226", "0228", "0229", "0233", "0234", "0235", "0237", "0238", "0240", "0241", "0242", "0243", "0244", "0246", "0247", "0248", "0250", "0254", "0255", "0256", "0257", "0258", "0259", "0260", "0261", "0263", "0264", "0265", "0266", "0267", "0268", "0269", "0270", "0274", "0276", "0277", "0278", "0279", "0280", "0282", "0283", "0284", "0285", "0287", "0288", "0289", "0291", "0293", "0294", "0295", "0296", "0297", "0299", "0422", "0428", "0436", "0438", "0439", "0460", "0463", "0465", "0466", "0467", "0470", "0475", "0476", "0478", "0479", "0480", "0493", "0494", "0495", "0531", "0532", "0533", "0536", "0537", "0538", "0539", "0544", "0545", "0547", "0548", "0550", "0551", "0553", "0554", "0555", "0556", "0557", "0558", "0561", "0562", "0563", "0564", "0565", "0566", "0567", "0568", "0569", "0572", "0573", "0574", "0575", "0576", "0577", "0578", "0581", "0584", "0585", "0586", "0587", "0594", "0595", "0596", "0597", "0598", "0599", "0721", "0725", "0735", "0736", "0737", "0738", "0739", "0740", "0742", "0743", "0744", "0745", "0746", "0747", "0748", "0749", "0761", "0763", "0765", "0766", "0767", "0768", "0770", "0771", "0772", "0773", "0774", "0776", "0778", "0779", "0790", "0791", "0794", "0795", "0796", "0797", "0798", "0799", "0820", "0823", "0824", "0826", "0827", "0829", "0833", "0834", "0835", "0836", "0837", "0838", "0845", "0846", "0847", "0848", "0852", "0853", "0854", "0855", "0856", "0857", "0858", "0859", "0863", "0865", "0866", "0867", "0868", "0869", "0875", "0877", "0879", "0880", "0883", "0884", "0885", "0887", "0889", "0892", "0893", "0894", "0895", "0896", "0897", "0898", "0920", "0930", "0940", "0942", "0943", "0944", "0946", "0947", "0948", "0949", "0950", "0952", "0954", "0955", "0956", "0957", "0959", "0964", "0965", "0966", "0967", "0968", "0969", "0972", "0973", "0974", "0977", "0978", "0979", "0980", "0982", "0983", "0984", "0985", "0986", "0987", "0993", "0994", "0995", "0996", "0997"
//    ]
//    // 3 digits, 3 length
//    var threeDigitsGroup: [String] {
//        let array = [
//            "011", "015", "017", "018", "019", "022", "023", "024", "025", "026", "027", "028", "029", "042", "043", "044", "045", "046", "047", "048", "049", "052", "053", "054", "055", "058", "059", "072", "073", "075", "076", "077", "078", "079", "082", "083", "084", "086", "087", "088", "089", "092", "093", "095", "096", "097", "098", "099"
//        ] + areaCodes.otherGroup
//        return array
//    }
//    // 2 digits, 4 length
//    var twoDigitsGroup: [String] {
//        let array = ["03", "04", "06"] + areaCodes.phoneGroup
//        return array
//    }
//}

// PhoneFormatter class
class PhoneFormatter {
    private let prefixCodes = PrefixCodes()
    private lazy var allCodes = [
        prefixCodes.fiveDigitsGroup,
        prefixCodes.fourDigitsGroup,
        prefixCodes.threeDigitsGroup,
        prefixCodes.twoDigitsGroup
    ]

    func splitNumber(phoneNumber: String) -> String {
        if phoneNumber.count < 6 {
            return phoneNumber
        }
        
        var groupedNumber: [String] = []
        
        for (index, codesArray) in allCodes.enumerated() {
            let number = phoneNumber as NSString
            let prefixLength = 5 - index                                  // same as map.first[0].length
            let prefixRange = NSRange(location: 0, length: prefixLength)
            let prefix = number.substring(with: prefixRange)              // tel[0, len]
            
            print("index", index)
            print("number.length", number.length)
            print("prefixLength", prefixLength)
            print("prefixRange", prefixRange)
            print("prefix", prefix)
            print()
            
            if let match = codesArray.first(where: { $0.key == prefix } ) {
                print("prefix \(match) matched!\n")                
                let suffixLenght = match.value           // map[tel[0, len]]
                // safeguard when second group length < area code length
                //            let suffixLenght = min(index + 1, number.length - prefixLength)
                let suffixRange = NSRange(location: prefixLength, length: suffixLenght)
                
                let tailStart = prefixLength + suffixLenght
                let tailLength = number.length - tailStart
                let tailRange = NSRange(location: tailStart, length: tailLength)
                
                print("number.length", number.length)
                print("suffixLenght", suffixLenght)
                print("suffixRange", suffixRange)
                print("tailRange", tailRange)
                print("suffixRange.length", suffixRange.length)
                print("tailRange.length", tailRange.length)
                
                // [tel[0, len], tel[len, len_2], tel[(len + len_2)..-1]]
                groupedNumber = [prefix]
                if suffixRange.length > 0 {
                    let suffix = number.substring(with: suffixRange)
                    groupedNumber.append(suffix)
                }
                
                if tailRange.length > 0 {
                    let tail = number.substring(with: tailRange)
                    groupedNumber.append(tail)
                }
                
                return groupedNumber.joined(separator: "-")
            }
        }
        return phoneNumber
    }
}


// Reference values
let testNumber1 = "01127166778"   // 011-271-66778
let testNumber2 = "012345"        // 0123-45
let testNumber3 = "0123456"       // 0123-45-6
let testNumber4 = "0633423333"    // 06-3342-3333
let testNumber5 = "0422212322"    // 0422-21-2322
let testNumber6 = "0120222222"    // 0120-222-222
let testNumber7 = "07023234556"   // 070-2323-4556
let testNumber8 = "08025259875"   // 080-2525-9875
let formatter1 = PhoneFormatter()
formatter1.splitNumber(phoneNumber: testNumber8)


// Performance
let start = CFAbsoluteTimeGetCurrent()
let formatter = PhoneFormatter()
formatter.splitNumber(phoneNumber: testNumber1)
formatter.splitNumber(phoneNumber: testNumber1)
formatter.splitNumber(phoneNumber: testNumber1)
formatter.splitNumber(phoneNumber: testNumber1)
formatter.splitNumber(phoneNumber: testNumber1)
formatter.splitNumber(phoneNumber: testNumber1)
formatter.splitNumber(phoneNumber: testNumber1)
formatter.splitNumber(phoneNumber: testNumber1)
formatter.splitNumber(phoneNumber: testNumber1)
formatter.splitNumber(phoneNumber: testNumber1)
let diff = CFAbsoluteTimeGetCurrent() - start
print(diff)
// Times (10 passes)
// sets (static):       0.1198129653930664
// arrays (static):     0.1395870447158813

// sets (instance):     0.269463062286377
// arrays (instance):   0.2828680276870728


