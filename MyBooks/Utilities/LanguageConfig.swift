//
//  LaguageConfig.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import UIKit
import Alamofire

class LanguageConfig: NSObject {
    
    // MARK: - App Language shifting Methods
    
    class func saveLang(lang: String) {
        UserDefaults.standard.set(lang, forKey: "AppLang")
    }
    
    class func appLang() -> String {
        if let lang = UserDefaults.standard.string(forKey: "AppLang") {
            return lang
        } else {
           return "localizable"
        }
    }
}
