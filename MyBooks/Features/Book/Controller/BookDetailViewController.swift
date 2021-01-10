//
//  BookDetailViewController.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var edtiButton: UIButton!
    
    var id: String = ""
    let viewModel = BookDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupViewModel()
        setupData()
    }
    
    func setupView(){
        title = "Book Detail"
        edtiButton.layer.cornerRadius = edtiButton.frame.height/2
        
    }

    func setupViewModel(){
        self.viewModel.showAlert = { success, bookDetail, message in
            self.handleAlert(bookDetail: bookDetail, success: success, message: message)
        }
    }
    
    func setupData(){
        self.viewModel.setViewModel(id: id)
        self.viewModel.getBookDetail()
    }
    
    func handleAlert(bookDetail: BookDetailResponse.DataClass, success:Bool, message: String) {
        if success {
            nameLabel.text = bookDetail.name
            descriptionLabel.text = bookDetail.dataDescription
            self.view.layoutIfNeeded()
        } else {
            print("failed fetch \(message)")
        }
    }

}
