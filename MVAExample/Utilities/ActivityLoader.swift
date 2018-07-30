//
//  ActivityLoader.swift
//  MVAExample
//
//  Created by moath on 4/24/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import UIKit
import Toast_Swift

protocol ActivityLoaderProtocol {
    func showLoader()
    func hideLoader()
    func show(error: String)
    func show(success: String)
}

extension ActivityLoaderProtocol where Self: UIView {
    func show(error: String) {
        self.makeToast(error.localizedLowercase)
    }
    
    func show(success: String) {
        self.makeToast(success)
    }
    
    func showLoader() {
        self.makeToastActivity(.center)
    }
    
    func hideLoader() {
        self.hideToastActivity()
    }
}

extension UIView: ActivityLoaderProtocol {}
