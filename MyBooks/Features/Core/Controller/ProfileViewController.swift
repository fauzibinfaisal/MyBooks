//
//  ProfileViewController.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    let viewModel = ProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupViewModel()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func setupView(){
        logoutButton.layer.cornerRadius = logoutButton.frame.height/2
    }
    
    func setupViewModel(){
        self.viewModel.showAlert = { success, fullname, username, message in
            self.handleAlert(fullname: fullname, username: username, success: success)
        }
    }
    
    func setupData(){
        self.viewModel.getProfile()
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        
    }
    
    func handleAlert(fullname:String, username:String, success:Bool) {
        if success {
            fullnameLabel.text = fullname
            usernameLabel.text = username
            self.view.layoutIfNeeded()
        } else {
            print("failed fetch")
        }
    }
    
}
