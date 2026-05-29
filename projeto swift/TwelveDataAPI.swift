import Foundation

struct TwelveDataAPI {
    private static let priceURL = "https://api.twelvedata.com/price"
    private static let profileURL = "https://api.twelvedata.com/profile"
    private static let apiKey = "e54993422e674d9d8050ee3c9654428e"
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    static func fetchPrice(for symbol: String) async throws -> TwelveData {
        let urlString = "\(priceURL)?symbol=\(symbol)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let (data, _) = try await URLSession.shared.data(for: request)
        return try decoder.decode(TwelveData.self, from: data)
    }
    
    
    
    static func fetchProfile(for symbol: String) async throws -> TwelveDataProfile {
        let urlString = "\(profileURL)?symbol=\(symbol)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let (data, _) = try await URLSession.shared.data(for: request)
        return try decoder.decode(TwelveDataProfile.self, from: data)
    }
}


/*struct DogAPI {
 static let endpoint = URL(string: "https://dog.ceo/api/breeds/image/random")!
 
 static var decoder: JSONDecoder {
     let decoder = JSONDecoder()
     decoder.keyDecodingStrategy = .convertFromSnakeCase
     return decoder
 }
 
 static func fetchUser() async throws -> Dog {
     let url = endpoint
     let request = URLRequest(url: url)
     
     let (data, _) = try await URLSession.shared.data(for: request)
     
     let user = try decoder.decode(Dog.self, from: data)
     
     return user
 }
}
*/
