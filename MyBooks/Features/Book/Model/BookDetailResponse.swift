//
//  BookDetailResponse.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 10/01/21.
//

import Foundation

// MARK: - BookDetailResponse
struct BookDetailResponse: Codable {
    var data: DataClass
    var bookDetailResponseDescription: String
    var statusCode: Int

    enum CodingKeys: String, CodingKey {
        case data
        case bookDetailResponseDescription = "description"
        case statusCode = "status_code"
    }
    
    // MARK: - DataClass
    struct DataClass: Codable {
        var createdAt: Int?
        var createdBy: EdBy?
        var deletedAt: JSONNull?
        var dataDescription, id: String?
        var modifiedAt: Int?
        var modifiedBy: EdBy?
        var name: String?

        enum CodingKeys: String, CodingKey {
            case createdAt, createdBy, deletedAt
            case dataDescription = "description"
            case id, modifiedAt, modifiedBy, name
        }
    }

    // MARK: - EdBy
    struct EdBy: Codable {
        var fullname, id, username: String?
    }

    // MARK: - Encode/decode helpers

    class JSONNull: Codable, Hashable {

        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
        }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }
}
