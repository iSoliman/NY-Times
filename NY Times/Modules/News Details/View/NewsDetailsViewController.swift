//
//  NewsDetailsViewController.swift
//  NY Times
//
//  Created by Islam Soliman on 3/20/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit

// MARK: - NewsDetailsViewModel
class NewsDetailsViewModel {
    
    let title: String
    let byLine: String
    let publishedDate: String
    let abstraction: String
    let url: URL?
    let imageUrls: [String]
    
    init(title: String?, byLine: String?, publishedDate: String?, abstraction: String?, url: String?, imageUrls: [String]?) {
        
        self.title = title ?? ""
        self.byLine = byLine ?? ""
        self.publishedDate = publishedDate ?? ""
        self.abstraction = abstraction ?? ""
        self.url = url != nil ? URL(string: url!): nil
        
        self.imageUrls = imageUrls ?? []
    }
    
}

// MARK: - NewsDetailsViewController
class NewsDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var labeltitle: UILabel!
    @IBOutlet weak var labelByLine: UILabel!
    @IBOutlet weak var labelPublishedDate: UILabel!
    @IBOutlet weak var labelAbstraction: UILabel!
    @IBOutlet weak var buttonSeeMore: UIButton!
    @IBOutlet weak var collectionViewImages: UICollectionView!
    
    // MARK: - Constants
    let cellNib = "NewsImageCell"
    let cellId = "NewsImageCellId"
    
    // MARK: - Variables
    var presenter: NewsDetailsPresenter?
    var imageUrls: [String] = []
    
    // MARK: - Viewcontroller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImagesCollectionView()
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Configurations
    func configureImagesCollectionView() {
        
        collectionViewImages.register(UINib(nibName: cellNib, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    
    // MARK: - Actions
    @IBAction func OpenUrl(_ sender: UIButton) {
        
        presenter?.openURL()
    }

}

extension NewsDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: NewsImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsImageCell
        
        cell.configureCellImage(with: imageUrls[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width - 10, height: collectionView.frame.size.height)
    }
    
}

// MARK: - NewsDetailsViewProtocol
protocol NewsDetailsViewProtocol: AnyObject {
    
    func configureSubViews(title: String, lineBy: String, publishedDate: String, abstraction: String)
    func hideSeeMoreButton()
    func setImages(with imagesUrl: [String])
}

extension NewsDetailsViewController: NewsDetailsViewProtocol {
    
    func configureSubViews(title: String, lineBy: String, publishedDate: String, abstraction: String) {
        
        labelByLine.text = lineBy
        labeltitle.text = title
        labelPublishedDate.text = publishedDate
        labelAbstraction.text = abstraction
    }
    
    func hideSeeMoreButton() {
        
        buttonSeeMore.isHidden = true
    }
    
    func setImages(with imageUrls: [String]) {
        
        self.imageUrls = imageUrls
        collectionViewImages.reloadData()
    }
    
}
