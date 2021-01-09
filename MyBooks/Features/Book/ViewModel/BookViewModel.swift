//
//  BookViewModel.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import Foundation

import Alamofire
import MKProgress

class BookViewModel: NSObject {
    
    var bookList = [BooksResponse.Book]()
    var showAlert: (_ success:Bool, _ bookList: [BooksResponse.Book],_ message: String) -> ()?
    let preferences = UserDefaults.standard
    
    required override init() {
        self.bookList = [BooksResponse.Book]()
        showAlert = {success, bookList, message in
        }
    }
    
    func getBookList(){
        MKProgress.show()
        APIClient.shared.getBook(completion: { (response, errorMsg) in
            MKProgress.hide()
            if let data = response {
                self.showAlert(true, data.data.books, "")
            }  else {
                if let errorMsg = errorMsg {
                    self.showAlert(false, [BooksResponse.Book](), errorMsg)
                }
            }
        })
    }
}
