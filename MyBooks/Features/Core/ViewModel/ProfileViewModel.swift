//
//  ProfileViewModel.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import Foundation
import Alamofire
import MKProgress

class ProfileViewModel: NSObject {
    
    var username : String
    var fullname : String
    var showAlert: (_ success:Bool, _ fullname:String, _ username:String,_ message: String) -> ()?
    let preferences = UserDefaults.standard
    
    required override init() {
        self.username = ""
        self.fullname = ""
        showAlert = {success, fullname, username, message in
        }
    }
    
    func getProfile(){
        MKProgress.show()
        APIClient.shared.getProfile(completion: { (response, errorMsg) in
            MKProgress.hide()
            if let data = response {
                self.showAlert(true, data.data.fullname, data.data.username , "")
            }  else {
                if let errorMsg = errorMsg {
                    self.showAlert(false, "","", errorMsg)
                }
            }
        })
    }
}
