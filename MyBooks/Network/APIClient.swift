//
//  APIClient.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import Foundation

import UIKit
import Alamofire
import SwiftyJSON

class APIClient: NSObject {
    
    enum APIResponseStatus : Int {
        case Success = 200
        case Failure = -1
        case SuccessAlso = 201
        case ValidationError = 409
        case BadRequest = 400
        case UnAuthorized = 401
        case NotFound = 404
        case InternalServerError = 500
        case Other
    }
    
    static let shared = APIClient()
    
    func getHTTPHeaders(method :HTTPMethod) -> HTTPHeaders? {
        switch method {
        case .post:
            return ["accept" : "application/json",
                    "Content-Type" : "application/x-www-form-urlencoded",
            ]
        default:
            return ["accept" : "application/json",
            ]
        }
    }
}

extension APIClient {
    
    func login(username:String, password:String, completion:@escaping (LoginResponse?, String?) -> Void) {
        let params = [APIParams.Login.username: username, APIParams.Login.password: password]
        let request = AF.request(BaseAPI.Login,
                                 method: .post,
                                 parameters: params as Parameters,
                                 headers: getHTTPHeaders(method: .post))
        
        request.responseJSON(completionHandler: { response in
            print("postLogin response: \(response)")
            let result = response.result
            switch result {
            case .success( _):
                if let dataResponse = try? JSONDecoder().decode(LoginResponse?.self, from: response.data!){
                print("Sudah di parsing postSelect")
                completion( dataResponse, nil)

                } else if let dataResponse = try? JSONDecoder().decode(ErrorResponse.self, from: response.data!){

                    completion(nil, dataResponse.errorResponseDescription)

                } else {
                    completion(nil, "Terjadi Kesalahan Pada Server")
                }

            // Do something with value
            case .failure(let error):
                if let underlyingError = error.underlyingError {
                    if let urlError = underlyingError as? URLError {
                        switch urlError.code {
                        case .timedOut:
                            completion(nil, "Timed out error")
                            print("Timed out error")
                        case .notConnectedToInternet:
                            completion(nil, "Not connected")
                        default:
                            //Do something
                            completion(nil, error.errorDescription)
                        }
                    } else {
                        completion(nil, "Unknown error")
                    }
                } else {
                    completion(nil, "Unknown error")
                }
            }
        })
    }
    
    func logout( completion:@escaping (LogoutResponse?, String?) -> Void) {
        let token: String = UserDefaults.standard.string(forKey: Constants.PreferenceKeys.Token) ?? ""
        let params = [APIParams.token: token]
        let request = AF.request(BaseAPI.Logout,
                                 method: .get,
                                 parameters: params as Parameters,
                                 headers: getHTTPHeaders(method: .get))
        
        request.responseJSON(completionHandler: { response in
            print("postLogout response: \(response)")
            let result = response.result
            switch result {
            case .success( _):
                
                if let dataResponse = try? JSONDecoder().decode(LogoutResponse?.self, from: response.data!){
                print("Sudah di parsing postSelect")
                completion( dataResponse, nil)
                    
                } else if let dataResponse = try? JSONDecoder().decode(ErrorResponse.self, from: response.data!){

                    completion(nil, dataResponse.errorResponseDescription)

                } else {
                    completion(nil, "Terjadi Kesalahan Pada Server")
                }

            // Do something with value
            case .failure(let error):
                if let underlyingError = error.underlyingError {
                    if let urlError = underlyingError as? URLError {
                        switch urlError.code {
                        case .timedOut:
                            completion(nil, "Timed out error")
                            print("Timed out error")
                        case .notConnectedToInternet:
                            completion(nil, "Not connected")
                        default:
                            //Do something
                            completion(nil, error.errorDescription)
                        }
                    } else {
                        completion(nil, "Unknown error")
                    }
                } else {
                    completion(nil, "Unknown error")
                }
            }
        })
    }
    
    
    func getProfile( completion:@escaping (ProfileResponse?, String?) -> Void) {
        let token: String = UserDefaults.standard.string(forKey: Constants.PreferenceKeys.Token) ?? ""
        let params = [APIParams.token: token]
        let request = AF.request(BaseAPI.Profile,
                                 method: .get,
                                 parameters: params as Parameters,
                                 headers: getHTTPHeaders(method: .get))
        
        request.responseJSON(completionHandler: { response in
            print("getProfile response: \(response)")
            let result = response.result
            switch result {
            case .success( _):
                
                if let dataResponse = try? JSONDecoder().decode(ProfileResponse?.self, from: response.data!){
                print("Sudah di parsing postSelect")
                completion( dataResponse, nil)
                    
                } else if let dataResponse = try? JSONDecoder().decode(ErrorResponse.self, from: response.data!){

                    completion(nil, dataResponse.errorResponseDescription)

                } else {
                    completion(nil, "Terjadi Kesalahan Pada Server")
                }

            // Do something with value
            case .failure(let error):
                if let underlyingError = error.underlyingError {
                    if let urlError = underlyingError as? URLError {
                        switch urlError.code {
                        case .timedOut:
                            completion(nil, "Timed out error")
                            print("Timed out error")
                        case .notConnectedToInternet:
                            completion(nil, "Not connected")
                        default:
                            //Do something
                            completion(nil, error.errorDescription)
                        }
                    } else {
                        completion(nil, "Unknown error")
                    }
                } else {
                    completion(nil, "Unknown error")
                }
            }
        })
    }
    
    func getBook( completion:@escaping (BooksResponse?, String?) -> Void) {
        let token: String = UserDefaults.standard.string(forKey: Constants.PreferenceKeys.Token) ?? ""
        let params = [APIParams.token: token]
        let request = AF.request(BaseAPI.Book,
                                 method: .get,
                                 parameters: params as Parameters,
                                 headers: getHTTPHeaders(method: .get))
        
        request.responseJSON(completionHandler: { response in
            print("getBook response: \(response)")
            let result = response.result
            switch result {
            case .success( _):
                
                if let dataResponse = try? JSONDecoder().decode(BooksResponse?.self, from: response.data!){
                print("Sudah di parsing postSelect")
                completion( dataResponse, nil)
                    
                } else if let dataResponse = try? JSONDecoder().decode(ErrorResponse.self, from: response.data!){

                    completion(nil, dataResponse.errorResponseDescription)

                } else {
                    completion(nil, "Terjadi Kesalahan Pada Server")
                }

            // Do something with value
            case .failure(let error):
                if let underlyingError = error.underlyingError {
                    if let urlError = underlyingError as? URLError {
                        switch urlError.code {
                        case .timedOut:
                            completion(nil, "Timed out error")
                            print("Timed out error")
                        case .notConnectedToInternet:
                            completion(nil, "Not connected")
                        default:
                            //Do something
                            completion(nil, error.errorDescription)
                        }
                    } else {
                        completion(nil, "Unknown error")
                    }
                } else {
                    completion(nil, "Unknown error")
                }
            }
        })
    }
    
    func getBookDetail(id:String, completion:@escaping (BookDetailResponse?, String?) -> Void) {
        let token: String = UserDefaults.standard.string(forKey: Constants.PreferenceKeys.Token) ?? ""
        let params = [APIParams.token: token, APIParams.id:id]
        let request = AF.request(BaseAPI.BookDetails,
                                 method: .get,
                                 parameters: params as Parameters,
                                 headers: getHTTPHeaders(method: .get))
        
        request.responseJSON(completionHandler: { response in
            print("getBookDetail response: \(response)")
            let result = response.result
            switch result {
            case .success( _):
                
                if let dataResponse = try? JSONDecoder().decode(BookDetailResponse?.self, from: response.data!){
                print("Sudah di parsing getBookDetail")
                completion( dataResponse, nil)
                    
                } else if let dataResponse = try? JSONDecoder().decode(ErrorResponse.self, from: response.data!){

                    completion(nil, dataResponse.errorResponseDescription)

                } else {
                    completion(nil, "Terjadi Kesalahan Pada Server")
                }

            // Do something with value
            case .failure(let error):
                if let underlyingError = error.underlyingError {
                    if let urlError = underlyingError as? URLError {
                        switch urlError.code {
                        case .timedOut:
                            completion(nil, "Timed out error")
                            print("Timed out error")
                        case .notConnectedToInternet:
                            completion(nil, "Not connected")
                        default:
                            //Do something
                            completion(nil, error.errorDescription)
                        }
                    } else {
                        completion(nil, "Unknown error")
                    }
                } else {
                    completion(nil, "Unknown error")
                }
            }
        })
    }
    
}
