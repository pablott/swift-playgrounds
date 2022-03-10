
struct BodyData: Codable {}
struct WearingGoods: Codable {}


enum UserDefaultsKeys: String {
    case bodyData
    case wearingGoods
    
    init?(for type: Codable.Type) {
        if type is BodyData.Type {
            self = .bodyData
            return
        }
        if type is WearingGoods.Type {
            self = .wearingGoods
            return
        }
        return nil
    }
}

private func convertKeytoType<T: Codable>(for key: UserDefaultsKeys) -> T.Type {
    switch key {
    case .bodyData:
        return type(of: BodyData.self)
    case .wearingGoods:
        return type(of: WearingGoods.self)
    }
}


let type = convertKeytoType(for: .bodyData)

