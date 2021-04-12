////
////  TableViewCell.swift
////  SMPCards
////
////  Created by Максим Жуков on 03.11.2020.
////  Copyright © 2020 Максим Жуков. All rights reserved.
////
//
//import UIKit
//
//class MainTableViewCell: UITableViewCell {
//
//
//
//    lazy var  numberOfCardAndDiagnosisLabel:UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "Verdana", size: 17)
//        label.textColor = #colorLiteral(red: 0.9650822282, green: 0.9695481658, blue: 0.9804657102, alpha: 1)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//
//
//    lazy var dateLabel:UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "Verdana", size: 14)
//        label.textColor = #colorLiteral(red: 0.8159223199, green: 0.8196992278, blue: 0.8289279342, alpha: 1)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//
//
//
//
//    lazy var nameLabel:UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "Verdana", size: 17)
//        label.textColor = #colorLiteral(red: 0.9650822282, green: 0.9695481658, blue: 0.9804657102, alpha: 1)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    var viewModel: MainCellViewModelType! {
//        didSet {
//            let numberOfCard = viewModel.numberOfCard != nil ? "№" + viewModel.numberOfCard! : ""
//            let diagnosis = viewModel.diagnosis != nil ?  ", " +  viewModel.diagnosis! : ""
//            self.numberOfCardAndDiagnosisLabel.text = numberOfCard + diagnosis
//            self.dateLabel.text = viewModel.date
//            self.nameLabel.text = viewModel.name
//        }
//    }
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
////        contentView.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        selectionStyle = .none
//        self.backgroundColor = #colorLiteral(red: 0.1566217244, green: 0.1594332755, blue: 0.1943226159, alpha: 1)
//
//        self.contentView.addSubview(numberOfCardAndDiagnosisLabel)
//        self.contentView.addSubview(dateLabel)
//        self.contentView.addSubview(nameLabel)
//
//        numberOfCardAndDiagnosisLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5).isActive = true
//        numberOfCardAndDiagnosisLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
//        numberOfCardAndDiagnosisLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
//        numberOfCardAndDiagnosisLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -5).isActive = true
//
//
//        //------------------------------------------------------------------
//
//        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//
//        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
//        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
//
//        //------------------------------------------------------------------
//
//        dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 5).isActive = true
//        dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
//        dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
//
//
//
//
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//
//}

//
//  TableViewCell.swift
//  SMPCards
//
//  Created by Максим Жуков on 03.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {



    lazy var  numberOfCardAndDiagnosisLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 17)
        label.textColor = #colorLiteral(red: 0.9547525048, green: 0.9635617137, blue: 0.9856582284, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()



    lazy var dateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 14)
        label.textColor = #colorLiteral(red: 0.8159223199, green: 0.8196992278, blue: 0.8289279342, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()





    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 17)
        label.textColor = #colorLiteral(red: 0.9547525048, green: 0.9635617137, blue: 0.9856582284, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var viewModel: MainCellViewModelType! {
        didSet {
            let numberOfCard = viewModel.numberOfCard != nil ? "№" + viewModel.numberOfCard! : ""
            let diagnosis = viewModel.diagnosis != nil ?  ", " +  viewModel.diagnosis! : ""
            self.numberOfCardAndDiagnosisLabel.text = numberOfCard + diagnosis
            self.dateLabel.text = viewModel.date
            self.nameLabel.text = viewModel.name
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)


        self.contentView.addSubview(numberOfCardAndDiagnosisLabel)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(nameLabel)

        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true


        //------------------------------------------------------------------

        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true

        //------------------------------------------------------------------

        numberOfCardAndDiagnosisLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3).isActive = true
        numberOfCardAndDiagnosisLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        numberOfCardAndDiagnosisLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true





    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



}
