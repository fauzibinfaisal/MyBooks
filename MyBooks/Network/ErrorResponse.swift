//
//  ErrorResponse.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

// MARK: - ErrorResponse
struct ErrorResponse: Codable {
    var data: DataClass
    var errorResponseDescription: String
    var statusCode: Int

    enum CodingKeys: String, CodingKey {
        case data
        case errorResponseDescription = "description"
        case statusCode = "status_code"
    }
    
    // MARK: - DataClass
    struct DataClass: Codable {
    }
}

