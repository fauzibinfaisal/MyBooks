//
//  LogoutResponse.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import Foundation

// MARK: - LogoutResponse
struct LogoutResponse: Codable {
    var data: DataClass?
    var logoutResponseDescription: String
    var statusCode: Int

    enum CodingKeys: String, CodingKey {
        case data
        case logoutResponseDescription = "description"
        case statusCode = "status_code"
    }
    
    // MARK: - DataClass
    struct DataClass: Codable {
    }
}


