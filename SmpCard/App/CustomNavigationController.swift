//
//  CustomNavigationController.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 14.04.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    var statusBarView: UIView!

    override var shouldAutorotate: Bool {
        if topViewController is CardPageViewController {
            return false
        }
        return true
    }
}
