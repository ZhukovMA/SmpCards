//
//  PatternsViewController.swift
//  SMPCards
//
//  Created by Максим Жуков on 06.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

class PatternsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let cellID = "Cell"
    var isReachedTheEndOfTable = true
    var viewModel: PatternsViewModelType!
    private var isFirstViewWillAppear = true
    var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    lazy var completion: (_ response: StorrageResponse) -> Void = { [unowned self] (response) in
        DispatchQueue.main.async {
            switch response {
            case .success:
                self.navigationItem.titleView = nil
                self.isReachedTheEndOfTable = false
                self.tableView.reloadData()
            case .realmComplete:
                self.navigationItem.titleView = nil
                self.isReachedTheEndOfTable = true
            case .realmIsEmpty:
                self.navigationItem.titleView = nil
                self.isReachedTheEndOfTable = true
            case .cloudComplete:
                if self.viewModel.numberOfPatterns == 0 {
                    self.viewModel.fetchFromLocalStorrage(completion: self.completion)
                    break
                }
                self.isReachedTheEndOfTable = true
                self.navigationItem.titleView = nil
            case .cloudIsUnavailable:
                self.viewModel.fetchFromLocalStorrage(completion: self.completion)
                self.isReachedTheEndOfTable = true
            case .cloudFetchedData:
                self.isReachedTheEndOfTable = false
                self.navigationItem.titleView = nil
                self.refreshControll.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }
    
    let activityView = UIActivityIndicatorView(style: .medium)
    
    lazy var patternSearchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Введите диагноз"
        sc.searchBar.barStyle = .black
        self.navigationItem.searchController = sc
        self.definesPresentationContext = true
        return sc
    }()
    
    var statusBarView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var refreshControll: UIRefreshControl = {
        let refreshControll = UIRefreshControl()
        refreshControll.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControll
    }()
    
    @objc private func refresh() {
        viewModel.fetchUpdatedData(completion: completion)
    }
    
    private func initTableView() {
        tableView.separatorColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.2729022298)
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.backgroundColor = #colorLiteral(red: 0.06691879034, green: 0.06652892381, blue: 0.06722356379, alpha: 1)
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControll
        
        tableView.register(PatternsTableViewCell.self, forCellReuseIdentifier: cellID)
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchStorredData(completion: completion)
        title = "Шаблоны"
        initTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        let newBackButton = UIBarButtonItem(title: "Назад", style: .done, target: self, action: #selector(backTapped))
        self.navigationItem.leftBarButtonItem = newBackButton
        view.addSubview(statusBarView)
        view.bringSubviewToFront(statusBarView)
        view.sendSubviewToBack(tableView)
        statusBarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        statusBarView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        statusBarView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        statusBarView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: false)
    }
    
    
    @objc func addTapped() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cardController = CardPageViewController()
        cardController.viewModel = viewModel.emptyCardViewModel()
        cardController.viewModel?.delegate = viewModel as? CardViewModelDelegate
        navigationController?.pushViewController(cardController, animated: false)
    }
    
    private func setUpActivityView() {
        activityView.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.titleView = activityView
        activityView.leftAnchor.constraint(equalTo: navigationItem.titleView!.leftAnchor).isActive = true
        activityView.rightAnchor.constraint(equalTo: navigationItem.titleView!.rightAnchor).isActive = true
        activityView.topAnchor.constraint(equalTo: navigationItem.titleView!.topAnchor).isActive = true
        activityView.bottomAnchor.constraint(equalTo: navigationItem.titleView!.bottomAnchor).isActive = true
        activityView.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        if isFirstViewWillAppear {
            setUpActivityView()
            isFirstViewWillAppear.toggle()
        } else {
            viewModel.fetchUpdatedData(completion: completion)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if patternSearchController.isFiltering {
            patternSearchController.searchBar.text?.removeAll()
            patternSearchController.isActive = false
        }
    }
    
}

extension PatternsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.filterContentForSearchText(searchController.searchBar.text!) { _ in
            self.tableView.reloadData()
        }
    }
}

