import Foundation

struct RecordModel: Codable {
    let results: [Result]
}

struct Result: Codable {
    let artistName: String
    let collectionPrice: Double
    let country: Country
    let primaryGenreName: String
}

enum Country: String, Codable {
    case usa = "USA"
}
