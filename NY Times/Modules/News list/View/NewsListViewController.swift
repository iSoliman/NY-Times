//
//  NewsListViewController.swift
//  NY Times
//
//  Created by Islam Soliman on 3/20/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit
import MBProgressHUD

// MARK: - NewsViewModel
class NewsViewModel {
    
    let title: String
    let byLine: String
    let publishedDate: String
    let type: String
    
    init(title: String?, byLine: String?, publishedDate: String?, type: String?) {
        
        self.title = title ?? ""
        self.byLine = byLine ?? ""
        self.publishedDate = publishedDate ?? ""
        self.type = type ?? ""
    }
}

// MARK: - NewsListViewController
class NewsListViewController: UIViewController {

    // MARK: - Variables
    var presenter: NewsListPresenter?
    var news: [NewsViewModel]?
    
    // MARK: - Constants
    let cellNib = "NewsCell"
    let cellId = "NewsCellId"
    
    // MARK: - Outlets
    @IBOutlet weak var tableViewNews: UITableView!
    @IBOutlet weak var labelNoData: UILabel!
    
    // MARK: - Viewcontroller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNewsTableView()
        
        presenter = NewsListPresenter(scene: self)
        presenter?.fetchNews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureNewsTableView() {
        
        tableViewNews.register(UINib(nibName: cellNib, bundle: nil), forCellReuseIdentifier: cellId)
        
        tableViewNews.rowHeight = UITableViewAutomaticDimension
        tableViewNews.estimatedRowHeight = tableViewNews.frame.size.height
        
        tableViewNews.tableFooterView = UIView()
    }

}

// MARK: - NewsListViewProtocol
protocol NewsListViewProtocol: AnyObject {
    
    func callingApiWillStart()
    func callingApiDidFinish()
    
    func newsDidLoadSuccefully(news: [NewsViewModel])
    func noNewsAvailable()
    func fetchingNewsDidFail(withError errorMsg: String)
    func push(viewController: UIViewController)
}

extension NewsListViewController: NewsListViewProtocol {
    
    func callingApiWillStart() {
        
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func callingApiDidFinish() {
        
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    func newsDidLoadSuccefully(news: [NewsViewModel]) {
        
        labelNoData.isHidden = true
        self.news = news
        tableViewNews.reloadData()
        
    }
    
    func noNewsAvailable() {
        
        labelNoData.isHidden = false
        self.news = nil
        tableViewNews.reloadData()
        
    }
    
    func fetchingNewsDidFail(withError errorMsg: String) {
        
        let alert = UIAlertController(title: nil, message: errorMsg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func push(viewController: UIViewController) {
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return news?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: NewsCell = tableView.dequeueReusableCell(withIdentifier: cellId) as! NewsCell
        
        cell.configureNewsCell(with: news![indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter?.selectNews(at: indexPath.row)
    }
    
}
