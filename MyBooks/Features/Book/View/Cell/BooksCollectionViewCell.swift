//
//  BooksCollectionViewCell.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageLagel: UIImageView!
    
    var bookName: String?
    var bookDescription: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    func setupView(){
        if let bookName = bookName{
            nameLabel.text = bookName
            descriptionLabel.text = bookDescription
        }
    }

}
