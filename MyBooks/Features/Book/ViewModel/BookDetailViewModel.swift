//
//  BookDetailViewModel.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 10/01/21.
//

import Foundation

import Alamofire
import MKProgress

class BookDetailViewModel: NSObject {
    
    var id: String
    var bookDetail :  BookDetailResponse.DataClass
    var showAlert: (_ success:Bool, _ bookList: BookDetailResponse.DataClass,_ message: String) -> ()?
    let preferences = UserDefaults.standard
    
    required override init() {
        self.id = ""
        self.bookDetail = BookDetailResponse.DataClass()
        showAlert = {success, bookList, message in
        }
    }
    
    func setViewModel(id: String) {
        self.id = id
    }
    
    func validate() -> Bool {
        if self.id.isEmpty {
            self.showAlert(false, BookDetailResponse.DataClass(), "Required.Message.username".localized())
            return false
        } else {
            return true
        }
    }
    
    func getBookDetail(){
        MKProgress.show()
        APIClient.shared.getBookDetail(id: id, completion: { (response, errorMsg) in
            MKProgress.hide()
            if let data = response {
                self.showAlert(true, data.data, "")
            }  else {
                if let errorMsg = errorMsg {
                    self.showAlert(false, BookDetailResponse.DataClass(), errorMsg)
                }
            }
        })
    }
}
