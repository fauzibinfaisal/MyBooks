//
//  APIClientProtocol.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol APIClientProtocol {
    
    func jobs(interesets:String, distance:String, completion:@escaping (APIClient.APIResponseStatus, JSON?) -> Void)
}
