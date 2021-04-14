//
//  TableViewController.swift
//  SMPCards
//
//  Created by Максим Жуков on 03.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit


class MainTableViewContoller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let cellID = "Cell"
    var keyboardHeight: CGFloat!
    
    var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
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
        if KeyboardService.shared.height == 0.0 { self.setKeyboardHeight() }
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
    
    var statusBarView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @objc func refresh() {
        viewModel.fetchUpdatedData(completion: completion)
    }
    
    private func initTableView() {
        
        tableView.separatorColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.2729022298)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.refreshControl = refreshControll
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellID)
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        title = "История"
        initTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        viewModel.fetchStorredData(completion: completion)
        view.addSubview(statusBarView)
        view.bringSubviewToFront(statusBarView)
        view.sendSubviewToBack(tableView)
        statusBarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        statusBarView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        statusBarView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        statusBarView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc func addTapped() {
        if  patternController == nil {
            patternController = PatternsTableViewController()
            patternController.viewModel = viewModel.patternsViewModel()
            patternController.viewModel?.delegate = viewModel as? PatternsViewModelDelegate
        }
        navigationController?.pushViewController(patternController, animated: false)
    }
    
    private func setKeyboardHeight() {
        let textField = UITextField()
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        textField.inputAccessoryView = doneToolbar
        view.addSubview(textField)
        textField.becomeFirstResponder()
        textField.resignFirstResponder()
        textField.removeFromSuperview()
    }
    
    @objc func doneButtonAction() {}
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        KeyboardService.shared.height = keyboardFrame.height
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

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if historySearchController.isFiltering {
            return viewModel.numberOfFilteredProfiles
        }
        return viewModel.numberOfProfiles
    }
   
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cardController = CardPageViewController()
        cardController.viewModel = viewModel.cardViewModel(forIndexPath: indexPath, isFiltered: historySearchController.isFiltering)
        cardController.viewModel?.delegate = viewModel as? CardViewModelDelegate
        navigationController?.pushViewController(cardController, animated: false)
        
    }
    
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
            self.viewModel.deleteRecord(forIndexPath: indexPath, completion: self.completion)
            tableView.reloadData()
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
        
        return swipeActions
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MainTableViewCell
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath, isFiltering: historySearchController.isFiltering)
        return cell
    }

     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
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
