//
//  StringExtension.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import UIKit
import Foundation

extension String {
    
    func dateFromIsoString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: String(self))!
    }
    
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: LanguageConfig.appLang(), value: "**\(self)**", comment: "")
    }
}
