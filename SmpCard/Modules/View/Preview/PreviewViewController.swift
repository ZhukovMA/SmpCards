//
//  ViewController.swift
//  SMPCards
//
//  Created by Максим Жуков on 12.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit
import WebKit


class PreviewViewController: UIViewController {
    
    lazy var pdfWebView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    
    func drawOnPDF(path: String ) {
        let pdf = CGPDFDocument(NSURL(fileURLWithPath: path))
        UIGraphicsBeginPDFContextToFile(path, CGRect.zero, nil)
        let index = 1
        let page =  pdf?.page(at: index)
        let pageFrame = page?.getBoxRect(.mediaBox)
        UIGraphicsBeginPDFPageWithInfo(pageFrame!, nil)
        let ctx = UIGraphicsGetCurrentContext()
        ctx!.saveGState()
        ctx!.scaleBy(x: 1, y: -1)
        ctx!.translateBy(x: 0, y: -pageFrame!.size.height)
        ctx!.drawPDFPage(page!)
        ctx!.restoreGState()
        
        let font = UIFont(name: "Verdana", size: 7)
        let textColor = UIColor.black
        let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle

        while let nextData = viewModel?.getNextDate() {
            if nextData.dataWithFrame.isEmpty {
                continue
            }
            
            nextData.dataWithFrame.forEach { (data) in
                if data.0.paragraphLenght == 0 {
                    paragraphStyle.alignment = .center
                } else {
                    paragraphStyle.alignment = .left
                }
                paragraphStyle.lineSpacing = CGFloat(data.0.lineSpacing)
                
                let textFontAttributes = [
                    NSAttributedString.Key.font: nextData.shouldReduce ? UIFont(name: "Verdana", size: 5.5)! : font!,
                    NSAttributedString.Key.foregroundColor: textColor,
                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                ]
                data.1.draw(in: CGRect(x: data.0.x, y: data.0.y, width: data.0.weight, height: data.0.height), withAttributes: textFontAttributes)
            }
        }
        UIGraphicsEndPDFContext()
    }

    
    var viewModel: PreviewViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pdfWebView)
        pdfWebView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pdfWebView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pdfWebView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pdfWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let url = viewModel?.getEmptyPDFUrl() {

            let request = URLRequest(url: url)
            pdfWebView.load(request)
            drawOnPDF(path: url.path)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(selectAction))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel?.handleDesapear()
    }

    @objc func selectAction() {
        
        let url = viewModel?.getTempFileURL()
        if let completeURL = url {
            let activityController = UIActivityViewController(activityItems: [completeURL], applicationActivities: nil)
            activityController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            activityController.popoverPresentationController?.permittedArrowDirections = .any
            present(activityController, animated: true, completion: nil)
        }
    }
    
    deinit {
        print("")
    }
    
}
