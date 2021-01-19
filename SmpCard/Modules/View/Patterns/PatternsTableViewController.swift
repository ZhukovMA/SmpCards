//
//  PatternsViewController.swift
//  SMPCards
//
//  Created by Максим Жуков on 06.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

class PatternsTableViewController: UITableViewController {
    let cellID = "Cell"
    var isReachedTheEndOfTable = true
    var viewModel: PatternsViewModelType!
    private var isFirstViewWillAppear = true
    
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
                  self.tableView.reloadData()
                  self.isReachedTheEndOfTable = false
                  self.navigationItem.titleView = nil
              }
            self.refreshControll.endRefreshing()

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
    
    lazy var refreshControll: UIRefreshControl = {
        let refreshControll = UIRefreshControl()
        refreshControll.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControll
    }()
    
    @objc private func refresh() {
        viewModel.fetchUpdatedData(completion: completion)
    }
    
    private func initTableView() {
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.separatorColor = #colorLiteral(red: 0.365568012, green: 0.3719425201, blue: 0.3995776176, alpha: 1)
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.backgroundColor = #colorLiteral(red: 0.1298618913, green: 0.131595701, blue: 0.1584605277, alpha: 1)
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControll

        tableView.register(PatternsTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchStorredData(completion: completion)
        title = "Шаблоны"
        initTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        let newBackButton = UIBarButtonItem(title: "Назад", style: .done, target: self, action: #selector(backTapped))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: false)
    }
    
    
    @objc func addTapped() {
        let cardController = CardTableViewController()
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if patternSearchController.isFiltering {
            return viewModel.numberOfFilteredPatterns
        }
        return viewModel.numberOfPatterns
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cardController = CardTableViewController()
        cardController.viewModel = viewModel.cardViewModel(forIndexPath: indexPath, isFiltered: patternSearchController.isFiltering)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PatternsTableViewCell
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath, isFiltering: patternSearchController.isFiltering)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == viewModel.numberOfPatterns {
            if !isReachedTheEndOfTable {
                isReachedTheEndOfTable = true
                viewModel.fetchStorredData(completion: completion)
            }
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

