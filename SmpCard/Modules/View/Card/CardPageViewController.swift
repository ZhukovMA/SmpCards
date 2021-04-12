//
//  CardPageViewController.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 22.02.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit


class PageTableViewCell: UICollectionViewCell {
    
    var mainView: CardAttributeItem!
    
    func configure(view: CardAttributeItem) {
        mainView = view
        mainView.view.frame = contentView.frame
        mainView.tableView.frame = contentView.frame

        contentView.addSubview(mainView.view)
    }
}



class CustomCollectionView: UICollectionView {
    
    override var contentSize: CGSize {
      didSet {
        self.invalidateIntrinsicContentSize()
      }
    }

    override var intrinsicContentSize: CGSize {
      self.layoutIfNeeded()
        return CGSize(width: 3750, height: UIView.noIntrinsicMetric )
    }

}


class CardPageViewController: UIViewController, FrontViewControllerDelegate {
    
    var startOffset = UIScreen.main.bounds.width
    var numberOfVC = 1
    var keyboardHeight: CGFloat!

    var startContentOffsetX: CGFloat!
    
    var collectionView: CustomCollectionView!
    
    var items = [CardAttributeItem]()
    
    var viewModel: CardViewModelType? {
        didSet {
            let item = CardAttributeItem()
            item.viewModel = viewModel?.cellViewModel(forIndexPath: 0)
            item.setupCells()
            items.append(item)
        }
    }


    
    lazy var pageBar: PageIndicator = {
        let pb = PageIndicator(frame: CGRect(x: 0, y: self.view.safeAreaInsets.top , width: UIScreen.main.bounds.width * 10, height: 30), inset: 100)
        pb.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        return pb
    }()
    
   
    
    
    func fronViewControllerDidApear(index: Int) {
        if index == 0 && flag {
            flag.toggle()
            for index in 1..<10 {
                let item = CardAttributeItem()
                item.viewModel = viewModel?.cellViewModel(forIndexPath: index)
                item.setupCells()
                items.append(item)
            }
            numberOfVC = 10
            collectionView.reloadData()
        }
        if index == 9 {
            collectionView.frame.size.width = view.bounds.width
        }
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageBar.frame = CGRect(x: 0, y: view.layoutMargins.top, width: view.frame.width, height: 30)
        collectionView.frame.origin.y = view.layoutMargins.top + 30
        collectionView.frame.size.height = view.safeAreaLayoutGuide.layoutFrame.height
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = CustomCollectionView(frame: CGRect(x: 0, y: 1, width: view.frame.width*10, height: 1), collectionViewLayout: layout)

        collectionView.isPagingEnabled = true
        view.addSubview(collectionView)
        collectionView.register(PageTableViewCell.self, forCellWithReuseIdentifier: "CellId")
        view.backgroundColor = #colorLiteral(red: 0.06691879034, green: 0.06652892381, blue: 0.06722356379, alpha: 1)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(pageBar)
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "PDF", style: .done, target: self, action: #selector(addTapped))
        let newBackButton = UIBarButtonItem(title: "Назад", style: .done, target: self, action: #selector(backTapped))
        self.navigationItem.leftBarButtonItem = newBackButton

        collectionView.contentSize = CGSize(width: view.frame.size.width * 10, height: view.frame.size.height)


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
    
   var flag = true
    var lastOffset: CGFloat = 0.0
    var lastIndex: Int = 0
    var newOffsetX: CGFloat = 0.0
    var percent: CGFloat = 0.0
    var currentIndexPathRow: Int = 0 {
        willSet {
            if newValue != currentIndexPathRow {
                let currentWidth = pageBar.titleOfHeader[newValue].getWidth(font: pageBar.fontforItem) + 20
                let preWidth = pageBar.titleOfHeader[currentIndexPathRow].getWidth(font: pageBar.fontforItem) + 20
                if newValue > currentIndexPathRow  {
                    startContentOffsetX += (preWidth + currentWidth)/2
                } else if newValue < currentIndexPathRow  {
                    startContentOffsetX -= (preWidth + currentWidth)/2
                }
            }
        }
    }
}



extension CardPageViewController : UIScrollViewDelegate{
    
    private var _direction: CGFloat {
        let currentOffset = collectionView.contentOffset.x - lastOffset
        var direction: CGFloat = 1.0
        if currentOffset > 0 {
            direction = 1
        } else if currentOffset < 0  {
            direction = -1
        }
        return direction
    }
    
   
        
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let direction = _direction
        setCurrentIndexPath(direction: direction)

        guard  let currentPageBarCell = pageBar.cellForItem(at: IndexPath(row: currentIndexPathRow, section: 0)) as? PageIndicatorBarCell  else { return }
        if startContentOffsetX == nil  {
            startContentOffsetX = pageBar.contentOffset.x

        }
        percent = _percent
        
        let nextPageBarCell = getNextCell(direction: direction)
        
        let widthOfCurrentPageBarItem = currentPageBarCell.frame.size.width
        let widthOfNextPageBarItem = nextPageBarCell?.frame.size.width ?? 0.0
        
        nextPageBarCell?.label.textColor = nextPageBarCell?.label.textColor.withAlphaComponent(0.4 + 0.6*abs(percent))
        currentPageBarCell.label.textColor = nextPageBarCell?.label.textColor.withAlphaComponent(1 - 0.6*abs(percent))
        
        newOffsetX = startContentOffsetX! + direction * (widthOfCurrentPageBarItem  + widthOfNextPageBarItem)/2 * percent
        pageBar.contentOffset.x = newOffsetX
        lastOffset = collectionView.contentOffset.x

    }
    
    private var _percent: CGFloat {
        var percent: CGFloat = 1
        let negativeDirection  = CGPoint(x: collectionView.contentOffset.x , y: collectionView.contentOffset.y)
        let positiveDirection = CGPoint(x: collectionView.contentOffset.x + view.frame.width, y: collectionView.contentOffset.y)
        if collectionView.indexPathForItem(at: negativeDirection)?.row != currentIndexPathRow {
            if collectionView.contentOffset.x > lastOffset {
                percent *= -1
            }
        } else if collectionView.indexPathForItem(at: positiveDirection)?.row != currentIndexPathRow {
            if collectionView.contentOffset.x < lastOffset {
                percent *= -1
            }
        }
        percent *= abs((collectionView.contentOffset.x - CGFloat(currentIndexPathRow) * view.frame.size.width) /  view.frame.size.width)
        return percent
    }
    
    private func setCurrentIndexPath(direction: CGFloat) {
        let positiveDirection = CGPoint(x: collectionView.contentOffset.x , y: collectionView.contentOffset.y)
        let negativeDirection = CGPoint(x: collectionView.contentOffset.x + view.frame.width , y: collectionView.contentOffset.y)
        if collectionView.indexPathForItem(at: positiveDirection)?.row == currentIndexPathRow ||
            collectionView.indexPathForItem(at: negativeDirection)?.row == currentIndexPathRow {} else {
                currentIndexPathRow = collectionView.indexPathForItem(at: direction > 0 ? positiveDirection : negativeDirection)?.row ?? currentIndexPathRow
        }
    }
    
    private func getNextCell(direction: CGFloat) -> PageIndicatorBarCell? {
        let negativeDirection  = CGPoint(x: collectionView.contentOffset.x , y: collectionView.contentOffset.y)
        let positiveDirection = CGPoint(x: collectionView.contentOffset.x + view.frame.width , y: collectionView.contentOffset.y)
        if (collectionView.indexPathForItem(at: positiveDirection)?.row != currentIndexPathRow) && currentIndexPathRow < numberOfVC - 1 {
            return pageBar.cellForItem(at: IndexPath(row: currentIndexPathRow + 1, section: 0)) as? PageIndicatorBarCell
        } else if collectionView.indexPathForItem(at: negativeDirection )?.row != currentIndexPathRow  {
            return pageBar.cellForItem(at: IndexPath(row: currentIndexPathRow - 1, section: 0)) as? PageIndicatorBarCell
        } else {
            return pageBar.cellForItem(at: IndexPath(row: currentIndexPathRow, section: 0)) as? PageIndicatorBarCell
        }
        
    }

}

extension CardPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfVC
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! PageTableViewCell
        addChild(items[indexPath.row])
        cell.configure(view: items[indexPath.row])
        cell.mainView.delegate = self
        cell.mainView.index = indexPath.row
        return cell
    }
    
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension CardPageViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            let orient = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation
            switch orient {
            case .portrait:
                print("Portrait")
            case .landscapeLeft,.landscapeRight :
                print("Landscape")
            default:
                print("Anything But Portrait")
            }
        }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            //refresh view once rotation is completed not in will transition as it returns incorrect frame size.Refresh here

        })
        super.viewWillTransition(to: size, with: coordinator)
    }
}
