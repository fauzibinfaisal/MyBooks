//
//  BooksViewController.swift
//  MyBooks
//
//  Created by Fauzi Fauzi on 09/01/21.
//

import UIKit

class BooksViewController: UIViewController {
    
    @IBOutlet weak var bookCollectionView: UICollectionView!
    var bookList = [BooksResponse.Book]()
    let booksViewModel = BookViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupViewModel()
        setupData()
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
        
        bookCollectionView.register(UINib.init(nibName: "BooksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BooksCollectionViewCell")

    }
    
    func setupViewModel(){
        self.booksViewModel.showAlert = { success, booklist, message in
            self.handleAlert(bookList: booklist, success: success)
        }
    }
    
    func setupData(){
        self.booksViewModel.getBookList()
    }
    
    func handleAlert(bookList : [BooksResponse.Book], success:Bool) {
        if success {
            self.bookList = bookList
            self.view.layoutIfNeeded()
            self.bookCollectionView.reloadData()
        } else {
            print("failed fetch")
        }
    }
    
    @IBAction func AddButtonTapped(_ sender: Any) {
        let vc = AddBookViewController(nibName: "AddBookViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension BooksViewController: UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.count
//        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BooksCollectionViewCell", for: indexPath) as! BooksCollectionViewCell
        cell.bookName = bookList[indexPath.row].name
        cell.bookDescription = bookList[indexPath.row].bookDescription
        cell.awakeFromNib()
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.size.width / 2
            return CGSize(width: width - 10, height: width + CGFloat(50))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            let vc = BookDetailViewController(nibName: "BookDetailViewController", bundle: nil)
            vc.id = bookList[indexPath.row].id
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let vc = BookDetailViewController(nibName: "BookDetailViewController", bundle: nil)
            vc.id = bookList[indexPath.row].id
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
