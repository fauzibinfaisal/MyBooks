//
//  LoginViewController.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var SiginButton: UIButton!
    
    let viewModel = LoginViewModel()
    let preferences = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupViewModel()
    }
    
    func setupView(){
        containerView.layer.cornerRadius = 10
        SiginButton.layer.cornerRadius = SiginButton.frame.height/2
    }
    
    func setupViewModel(){
        self.viewModel.showAlert = { success, title, message, token in
            self.handleAlert(title: title, message: message, success: success, token: token)
        }
    }
    
    func handleAlert(title:String, message:String, success:Bool, token: String) {
        if success {
            performSegue(withIdentifier: "Home", sender: self)
        } else {
            self.alertWithOkAction(title: title, message: message)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Home"{
            //            if let vc = segue.destination as? HomeTabBarController {
            //
            //            }
        }
    }
    
    @IBAction func SigninTapped(_ sender: Any) {
        self.viewModel.getLogin(username: usernameTextField.text!, password: passwordTextField.text!)
        
        if self.viewModel.validate(){
                self.viewModel.login()
        }
    }
}

