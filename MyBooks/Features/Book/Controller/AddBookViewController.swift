//
//  AddBookViewController.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import UIKit

class AddBookViewController: UIViewController {
    
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView(){
        title = "Add Book"
        
    }

}
