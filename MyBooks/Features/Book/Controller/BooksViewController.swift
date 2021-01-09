//
//  BooksViewController.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import UIKit

class BooksViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var booksResponse: BooksResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
        
        collectionView.register(UINib.init(nibName: "BooksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BooksCollectionViewCell")
        
        collectionView.delegate = self
    }
    
    @IBAction func AddButtonTapped(_ sender: Any) {
        let vc = AddBookViewController(nibName: "AddBookViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension BooksViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let books = booksResponse?.data.books{
            return books.count
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BooksCollectionViewCell", for: indexPath) as! BooksCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let sectionInsets = UIEdgeInsets(top: 5.0,
                                          left: 12.0,
                                          bottom: 5.0,
                                          right: 12.0)

        let paddingSpace = sectionInsets.left * (itemsPerRow) - sectionInsets.left
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let heightPerItem = widthPerItem + 110
        
        self.view.layoutIfNeeded()
        return CGSize(width: widthPerItem - 20, height: heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            let vc = BookDetailViewController(nibName: "BookDetailViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let vc = BookDetailViewController(nibName: "BookDetailViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
