//
//  TableViewController.swift
//  SMPCards
//
//  Created by Максим Жуков on 03.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit


class MainTableViewContoller: UITableViewController {
    let cellID = "Cell"
    var isReachedTheEndOfTable = true
    var viewModel: MainViewModelType!
    private var patternController: PatternsTableViewController!
    private var isFirstViewWillAppear = true
    lazy var completion: (_ response: StorrageResponse) -> Void = { [unowned self] (response) in
        DispatchQueue.main.async {
            switch response {
            case .success:
                self.navigationItem.titleView = nil
                self.isReachedTheEndOfTable = false
                self.refreshControll.endRefreshing()
                self.tableView.reloadData()
            case .realmComplete:
                self.navigationItem.titleView = nil
                self.isReachedTheEndOfTable = true
            case .realmIsEmpty:
                self.navigationItem.titleView = nil
                self.isReachedTheEndOfTable = true
            case .cloudComplete:
                if self.viewModel.numberOfProfiles == 0 {
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
    
    lazy var historySearchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Введите имя"
        sc.searchBar.barStyle = .black
        self.navigationItem.searchController = sc
        self.definesPresentationContext = true
        return sc
    }()
    
    lazy var  refreshControll: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    @objc func refresh() {
        viewModel.fetchUpdatedData(completion: completion)
    }
    
    private func initTableView() {
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.separatorColor = #colorLiteral(red: 0.365568012, green: 0.3719425201, blue: 0.3995776176, alpha: 1)
        tableView.backgroundColor = #colorLiteral(red: 0.1298618913, green: 0.131595701, blue: 0.1584605277, alpha: 1)
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.refreshControl = refreshControll
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellID)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "История"
        initTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        viewModel.fetchStorredData(completion: completion)
    }
    
    @objc func addTapped() {
        if  patternController == nil {
            patternController = PatternsTableViewController()
            patternController.viewModel = viewModel.patternsViewModel()
            patternController.viewModel?.delegate = viewModel as? PatternsViewModelDelegate
        }
        navigationController?.pushViewController(patternController, animated: false)
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
        tableView.reloadData()
        if isFirstViewWillAppear {
            setUpActivityView()
            isFirstViewWillAppear.toggle()
        } else {
            viewModel.fetchUpdatedData(completion: completion)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if historySearchController.isFiltering {
            historySearchController.searchBar.text?.removeAll()
            historySearchController.isActive = false
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if historySearchController.isFiltering {
            return viewModel.numberOfFilteredProfiles
        }
        return viewModel.numberOfProfiles
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cardController = CardTableViewController()
        cardController.viewModel = viewModel.cardViewModel(forIndexPath: indexPath, isFiltered: historySearchController.isFiltering)
        cardController.viewModel?.delegate = viewModel as? CardViewModelDelegate
        navigationController?.pushViewController(cardController, animated: false)
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
            self.viewModel.deleteRecord(forIndexPath: indexPath, completion: self.completion)
            tableView.reloadData()
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
        
        return swipeActions
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MainTableViewCell
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath, isFiltering: historySearchController.isFiltering)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !isReachedTheEndOfTable, indexPath.row + 1 == viewModel.numberOfProfiles {
            isReachedTheEndOfTable = true
            viewModel.fetchStorredData(completion: completion)
        }
    }
}

extension MainTableViewContoller: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.filterContentForSearchText(searchController.searchBar.text!) { _ in
            self.tableView.reloadData()
        }
    }
}

extension UISearchController {
    var searchBarIsEmpty: Bool {
        guard let text = self.searchBar.text  else {
            return false
        }
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return self.isActive && !searchBarIsEmpty
    }
}
