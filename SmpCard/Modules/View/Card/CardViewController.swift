//
//  TableViewView.swift
//  SMPCards
//
//  Created by Максим Жуков on 03.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

class CardTableViewController: UITableViewController, Output  {
    let perfomanceCellID = "perfomanceCell"
    let selectableCellID = "selectableCell"
    let textCellID = "nonSelectableCell"
    let dateCellID = "date"
    
    var viewModel: CardViewModelType?


    func didChangeText(str: String, indexPath: IndexPath) {
        UIView.setAnimationsEnabled(false)
        tableView?.beginUpdates()
        tableView?.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.register(CardPerfomanceTableViewCell.self, forCellReuseIdentifier: perfomanceCellID)
        tableView.register(CardSelectableAttributeTableViewCell.self, forCellReuseIdentifier: selectableCellID)
        tableView.register(CardTextAttributeTableViewCell.self, forCellReuseIdentifier: textCellID)
        tableView.register(CardDateTableViewCell.self, forCellReuseIdentifier: dateCellID)
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = #colorLiteral(red: 0.3310863674, green: 0.3596991897, blue: 0.3980243504, alpha: 0.7322078339)
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.1298618913, green: 0.131595701, blue: 0.1584605277, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "PDF", style: .done, target: self, action: #selector(addTapped))
        let newBackButton = UIBarButtonItem(title: "Назад", style: .done, target: self, action: #selector(backTapped))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc func backTapped() {
        let alert = UIAlertController(title: "Сохранить?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .default) { (action) in
            self.viewModel?.returnData()
            self.navigationController?.popViewController(animated: false)
        })
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel) { (action) in
            self.navigationController?.popViewController(animated: false)
        })
        present(alert, animated: true, completion: nil)
    }
    
    
    @objc func addTapped() {
        let previewController = PreviewViewController()
        previewController.viewModel = viewModel?.previewViewModel()
        navigationController?.pushViewController(previewController, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    //MARK:- UITableView Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return viewModel?.numberOfRow ?? 0
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if viewModel?.isDateCell(indexPath: indexPath) ?? false {
                 guard let cell = tableView.dequeueReusableCell(withIdentifier: dateCellID, for: indexPath) as? CardDateTableViewCell else { return UITableViewCell() }
                cell.viewModel = viewModel?.cellViewModel(forIndexPath: indexPath) as? CardTextCellViewModelType
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: textCellID, for: indexPath) as? CardTextAttributeTableViewCell else { return UITableViewCell() }
                cell.viewModel = viewModel?.cellViewModel(forIndexPath: indexPath) as? CardTextCellViewModelType
                cell.delegate = self
                cell.indexPath = indexPath
                return cell
            }
        case 1:
            if viewModel?.isTextCell(indexPath: indexPath) ?? false {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: textCellID, for: indexPath) as? CardTextAttributeTableViewCell else { return UITableViewCell() }
                cell.viewModel = viewModel?.cellViewModel(forIndexPath: indexPath) as? CardTextCellViewModelType
                cell.delegate = self
                cell.indexPath = indexPath
                return cell
            } else {
                if let viewModelCell = viewModel?.cellViewModel(forIndexPath: indexPath) as? CardSelectableCellViewModelType {
                     guard let cell = tableView.dequeueReusableCell(withIdentifier: selectableCellID, for: indexPath) as? CardSelectableAttributeTableViewCell else { return UITableViewCell() }
                    cell.viewModel = viewModelCell
                    return cell
                } else if let viewModelCell = viewModel?.cellViewModel(forIndexPath: indexPath) as?  CardPerfomanceCellViewModel {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: perfomanceCellID, for: indexPath) as? CardPerfomanceTableViewCell else { return UITableViewCell() }
                    cell.viewModel = viewModelCell
                    return cell
                }
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
        
    }
    
    //MARK:- UITableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && !(viewModel?.isTextCell(indexPath: indexPath) ?? false ){
            let additionalController = AdditionalViewController()
            additionalController.viewModel = viewModel?.additionalViewModel(forIndexPath: indexPath)
            additionalController.title = viewModel?.getTitle(forIndexPath: indexPath)
            navigationController?.pushViewController(additionalController, animated: true)
        } else {
            guard let cell = tableView.cellForRow(at: indexPath) as? CardTextAttributeTableViewCell  else {return}
            cell.complaintsTextView.becomeFirstResponder()
        }
    }
    
    deinit {
        print("")
    }
}

