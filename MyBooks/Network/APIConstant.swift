//
//  APIConstant.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import Foundation

struct BaseAPI {
    static let Root = "http://apitesting.incenplus.com"
    static let User = Root+"/users"
    static let Book = Root+"/books"
    static let Login = User+"/login"
    static let Profile = User+"/me"
}

struct APIParams {
    static let token = "token"
    struct Login {
        static let username = "username"
        static let password = "password"
    }
}
