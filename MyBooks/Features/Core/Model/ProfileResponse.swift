//
//  ProfileResponse.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import Foundation

// MARK: - ProfileResponse
struct ProfileResponse: Codable {
    var data: DataClass
    var profileResponseDescription: String?
    var statusCode: Int?

    enum CodingKeys: String, CodingKey {
        case data
        case profileResponseDescription = "description"
        case statusCode = "status_code"
    }
    
    // MARK: - DataClass
    struct DataClass: Codable {
        var active: Bool?
        var fullname, id, username: String
    }
}


