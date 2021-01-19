//
//  TableViewController.swift
//  SMPCards
//
//  Created by Максим Жуков on 15.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

class AdditionalViewController: UITableViewController, AdditionalTextTableViewCellDelegate {
    let selectableCellID =  "selectableCell"
    let textCellID = "textCell"
    
    func didChangeText(str: String, indxPathRow: Int) {
        UIView.setAnimationsEnabled(false)
        tableView?.beginUpdates()
        tableView?.endUpdates()
        UIView.setAnimationsEnabled(true)
    }
    
    var viewModel: AdditionalViewModelType? {
        didSet {
            viewModel?.getSelectedIndexPaths().forEach { (indexPath) in
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.allowsMultipleSelection = true
        tableView.separatorColor = #colorLiteral(red: 0.365568012, green: 0.3719425201, blue: 0.3995776176, alpha: 1)
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.register(AdditionalSelectableTableViewCell.self, forCellReuseIdentifier: selectableCellID)
        tableView.register(AdditionalTextTableViewCell.self, forCellReuseIdentifier: textCellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.1298618913, green: 0.131595701, blue: 0.1584605277, alpha: 1)
        if let vm = viewModel, vm.isAssistanceProvided {
            setupTableFooter()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel?.sendCompleteData()
        
    }
    
    private func setupTableFooter() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2))
        footerView.autoresizingMask = .flexibleWidth
        let addButton = UIButton()
        footerView.addSubview(addButton)
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 20).isActive = true
        addButton.titleLabel?.center = footerView.center
        addButton.backgroundColor = .blue
        addButton.layer.cornerRadius = 10
        addButton.setTitle("Добавить временные показатели", for: .normal)
        addButton.addTarget(self, action: #selector(addIndicatorItem), for: .touchDown)
        tableView.tableFooterView = footerView
    }
    
    @objc private func addIndicatorItem() {
        viewModel?.addIndicatorItem()
        tableView.reloadData()
    }
    
    //MARK:- UITableView Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSection ?? 0
    }
    
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowInSection(section: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AdditionalSelectableTableViewCell else {return}
        viewModel?.removeSubAttribute(forIndexPath: indexPath)
        tableView.beginUpdates()
        cell.accessoryType = .none
        tableView.endUpdates()
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AdditionalTextTableViewCell,
            !(viewModel?.cellIsActive(forIndexPath: indexPath) ?? false) {
            cell.dataTextView.becomeFirstResponder()
            return
        } else if let cell = tableView.cellForRow(at: indexPath) as? AdditionalSelectableTableViewCell {
            viewModel?.addSubAttribute(forIndexPath: indexPath)
            cell.accessoryType = .checkmark
            if !(viewModel?.sectionIsMultiple(forIndexPath: indexPath) ?? false){
                deselectOtherCells(forIndexPath: indexPath)
            }
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: selectableCellID, for: indexPath) as? AdditionalSelectableTableViewCell, let cellViewModel = viewModel?.cellViewModel(forIndexPath: indexPath) as? AdditionalSelectableCellViewModel {
            cell.viewModel = cellViewModel
            let cellIsActive = viewModel?.cellIsActive(forIndexPath: indexPath) ?? false
            cell.accessoryType = cellIsActive ? .checkmark : .none
            return cell
        } else if let cell = tableView.dequeueReusableCell(withIdentifier: textCellID, for: indexPath) as? AdditionalTextTableViewCell,
            let cellViewModel = viewModel?.cellViewModel(forIndexPath: indexPath) as? AdditionalTextCellViewModel {
            cell.viewModel = cellViewModel
            cell.delegate = self
            cell.indexPath = indexPath
            return cell
        } else { return UITableViewCell() }
    }
}

extension AdditionalViewController {
    private func deselectOtherCells(forIndexPath indexPath: IndexPath) {
        if let indexPathsInSection = tableView.indexPathsForSelectedRows?.filter ({ $0.section == indexPath.section && $0.row != indexPath.row }) {
            for selectedPath in indexPathsInSection {
                tableView.deselectRow(at: selectedPath, animated: false)
                viewModel?.removeSubAttribute(forIndexPath: selectedPath)
                guard let cellselected = tableView.cellForRow(at: selectedPath) as? AdditionalSelectableTableViewCell else {continue}
                cellselected.accessoryType = .none
            }
        }
    }
}
