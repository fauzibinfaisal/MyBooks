//
//  BooksCollectionViewCell.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageLagel: UIImageView!
    
    var bookName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    func setupView(){
        if let bookName = bookName{
            nameLabel.text = bookName
        }
    }

}
