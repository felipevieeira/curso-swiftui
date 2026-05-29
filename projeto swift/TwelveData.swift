import SwiftUI

struct TwelveData: Codable {
    let price: String
}

extension TwelveData {
    var doublePrice: Double {
        (price as NSString).doubleValue
    }
}

struct TwelveDataProfile: Codable {
    let symbol: String
    let name: String
    let exchange: String
    let sector: String
    let logo: String?
}

struct SymbolSnapshot {
    let symbol: String
    let price: Double
    let date: Date = .now
}
