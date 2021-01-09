//
//  LoginViewModel.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//
import UIKit
import Alamofire
import MKProgress

class LoginViewModel: NSObject {
    
    var username : String
    var password : String
    var showAlert: (_ success:Bool, _ title:String, _ message:String,_ token: String) -> ()?
    let preferences = UserDefaults.standard
    
    required override init() {
        self.username = ""
        self.password = ""
        showAlert = {success, title, message, token in
        }
    }
    
    func getLogin(username:String, password:String) {
        self.username = username
        self.password = password
    }
    
    func validate() -> Bool {
        if self.username.isEmpty {
            self.showAlert(false,"Error.Alert.Title".localized(),"Required.Message.username".localized(),"")
            return false
        } else if self.password.isEmpty {
            self.showAlert(false, "Error.Alert.Title".localized(),"Required.Message.password".localized(),"")
            return false
        } else {
            return true
        }
    }
    
    func login(){
        MKProgress.show()
        APIClient.shared.login(username: username, password: password) { (response, errorMsg) in
            MKProgress.hide()
            if let _ = response {
                self.showAlert(true, "Success.Alert.Title".localized(),"Success.Message.Register".localized(),(response?.data?.token)!)
                self.preferences.set(
                    (response?.data?.token)!,
                    forKey: Constants.PreferenceKeys.Token)
            }  else {
                if let errorMsg = errorMsg {
                    self.showAlert(false, errorMsg.localized(),errorMsg.localized(), "")
                }
            }
        }
    }

}
