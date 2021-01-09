//
//  LoginResponse.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//
// MARK: - LoginResponse
struct LoginResponse: Codable {
    
    var data: DataClass?
    var loginResponseDescription: String?
    var statusCode: Int?

    enum CodingKeys: String, CodingKey {
        case data
        case loginResponseDescription = "description"
        case statusCode = "status_code"
    }
    
    // MARK: - DataClass
    struct DataClass: Codable {
        var token: String?
        var user: User?
    }

    // MARK: - User
    struct User: Codable {
        var active: Bool?
        var fullname, id, username: String?
    }
}



