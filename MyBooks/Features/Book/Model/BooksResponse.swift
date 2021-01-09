//
//  BooksResponse.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import Foundation


// MARK: - BooksResponse
struct BooksResponse: Codable {
    var data: DataClass
    var booksResponseDescription: String?
    var statusCode: Int?

    enum CodingKeys: String, CodingKey {
        case data
        case booksResponseDescription = "description"
        case statusCode = "status_code"
    }
    
    // MARK: - DataClass
    struct DataClass: Codable {
        var books: [Book]
    }

    // MARK: - Book
    struct Book: Codable {
        var createdAt: Int?
        var createdBy: EdBy?
        var deletedAt: JSONNull?
        var bookDescription, id: String
        var modifiedAt: Int?
        var modifiedBy: EdBy?
        var name: String

        enum CodingKeys: String, CodingKey {
            case createdAt, createdBy, deletedAt
            case bookDescription = "description"
            case id, modifiedAt, modifiedBy, name
        }
    }

    // MARK: - EdBy
    struct EdBy: Codable {
        var fullname: Fullname?
        var id: ID?
        var username: Username?
    }

    enum Fullname: String, Codable {
        case incenplus = "Incenplus"
    }

    enum ID: String, Codable {
        case the5E394A2Ce43Ddee40B30A41E = "5e394a2ce43ddee40b30a41e"
    }

    enum Username: String, Codable {
        case icp = "icp"
    }
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
