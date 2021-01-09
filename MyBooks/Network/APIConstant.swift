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
    static let Logout = User+"/logout"
    static let Profile = User+"/me"
    static let BookDetails = Book+"/detail"
    static let BookEdit = Book+"/edit"
    static let Bookinsert = Book+"/insert"
}

struct APIParams {
    static let token = "token"
    static let id = "id"
    struct Login {
        static let username = "username"
        static let password = "password"
    }
    
    struct Book {
        static let id = "id"
        static let name = "name"
        static let description = "description"
    }
}
