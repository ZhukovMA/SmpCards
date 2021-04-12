//
//  FrontViewController.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 22.02.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

protocol FrontViewControllerDelegate: class {
    func fronViewControllerDidApear(index: Int)
}

class DelegateHelper {
    static let shared = DelegateHelper()
    var cardTableView: Output?
}

class CustomTableView: UITableView {
    override func scrollRectToVisible(_ rect: CGRect, animated: Bool) {
        
    }
    func scrollToRect(_ rect: CGRect) {
        super.scrollRectToVisible(rect, animated: true)
    }
}

class CardAttributeItem: UIViewController , Output, UpdateTable {
    func update() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    var tableView: CustomTableView!

    var index: Int!
    var indexPathRow: Int!
    var firstResponderView: UIView!
    weak var delegate: FrontViewControllerDelegate?
    let tableCellID = "tableCell"
    let selectableCellID = "selectableCell"
    let textTableCellID = "nonSelectableCell"
    let dateTableCellID = "date"
    var viewModel: CardCellViewModelType?
    var keyboardHeight: CGFloat!
    
    var cells = [UITableViewCell]()
 
    func setupCells() {
       guard let vm = viewModel else { return }
       for row in 0..<vm.numberOfRowInSection(section: 0) {
        switch viewModel!.getCellType(indexPathRow: row) {
        case .selectable:
            let cell =  CardSelectableTableViewCell()
            cell.viewModel = vm.cellViewModel(forIndexPathRow: row) as? CardSelectableCellViewModelType
            cell.delegate = self
            cell.indexPathRow = row
            cells.append(cell)
        case .table:
            let cell = CardTableAttributeTableViewCell()
            cell.delegate1 = self
            cell.delegate = self
            cell.tableContentView.table._delegate = self
            cell.viewModel = viewModel?.cellViewModel(forIndexPathRow: row) as? CardTableCellViewModelType
            cell.indexPathRow = row
            cells.append(cell)
        case .text:
            let cell =  CardTextAttributeTableViewCell()
            cell.viewModel = viewModel?.cellViewModel(forIndexPathRow: row) as? CardTextCellViewModelType
            cell.delegate = self
            cell.indexPathRow = row
            cells.append(cell)
        }
       }
   }

    @objc fileprivate func keyboardWillShow(notification:NSNotification) {
//        if let keyboardRectValue = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//             keyboardHeight = keyboardRectValue.height
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = CustomTableView(frame: view.frame, style: .grouped)
        view.addSubview(tableView)
        setupCells()

        tableView.backgroundColor = #colorLiteral(red: 0.06691879034, green: 0.06652892381, blue: 0.06722356379, alpha: 1)
        tableView.register(CardTableAttributeTableViewCell.self, forCellReuseIdentifier: tableCellID)
        tableView.register(CardSelectableTableViewCell.self, forCellReuseIdentifier: selectableCellID)
        tableView.register(CardTextAttributeTableViewCell.self, forCellReuseIdentifier: textTableCellID)
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 44.0;
        tableView.separatorColor = #colorLiteral(red: 0.09527605027, green: 0.09529984742, blue: 0.09527292103, alpha: 1)
//        tableView.tableHeaderView = UIView(frame: CGRect(x: CGFloat.leastNonzeroMagnitude, y: CGFloat.leastNonzeroMagnitude, width: tableView.bounds.size.width, height: 10))
        tableView.dataSource = self

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        tableView.reloadData()
    }
    

    @objc func keyboardWillHide(notification: Notification) {
        self.tableView.contentInset.bottom = 0
    }
    
    func didChangeText(str: String, indexPathRow: Int) {
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
    }

    func textViewShouldBeginEditing( firstResponderView: UIView) {
        self.tableView.contentInset.bottom = KeyboardService.shared.height

        let firstResponderViewMaxY = tableView.getFullOriginY(firstResponderView) + firstResponderView.frame.height - tableView.contentOffset.y
        let safeAreaWithKeyboard = tableView.frame.height - KeyboardService.shared.height
        if  safeAreaWithKeyboard < firstResponderViewMaxY {
            let newContentOfSet = tableView.contentOffset.y + (firstResponderViewMaxY - safeAreaWithKeyboard) + 40
            self.tableView.setContentOffset(CGPoint(x: tableView.contentOffset.x, y: newContentOfSet), animated: true)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate!.fronViewControllerDidApear(index: index)
    }
}

extension CardAttributeItem: UITableViewDelegate, UITableViewDataSource {
    //MARK:- UITableView Data Source
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowInSection(section: section) ?? 0
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
    
    //MARK:- UITableView Delegate
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CardTextAttributeTableViewCell  else {return}
        cell.complaintsTextView.becomeFirstResponder()
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
}


//private extension Selector {
//    static let keyboardWillShow = #selector(CollectionViewCell.keyboardWillShow(notification:))
//}


extension UITableView {
     func getFullOriginY(_ view: UIView) -> CGFloat {
        if let superview = view.superview, view !== self{
            return view.frame.origin.y + getFullOriginY(superview)
        } else {
            return 0.0
        }
    }
}
