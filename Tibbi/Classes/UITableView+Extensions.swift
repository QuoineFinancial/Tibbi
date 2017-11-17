//
//  UITableView+Extensions.swift
//  Viper
//
//  Created by Cristian Azov on 8/23/17.
//  Copyright © 2017 Cristian Azov. All rights reserved.
//

import UIKit

extension UITableView {

    /// Assumes that NibNames match CellIdentifiers and ClassNames

    open func registerNibs(for cellClasses: [AnyClass]) {
        for cellClass in cellClasses {
            self.registerNib(for: cellClass.self)
        }
    }

    /// Assumes that NibName matches CellIdentifier and ClassName

    open func registerNib(for cellClass: AnyClass) {
        self.registerNib(name: String(describing: cellClass.self), cellClass: cellClass)
    }

    /// Assumes that NibName matches CellIdentifier

    open func registerNib(name: String, cellClass: AnyClass) {
        let nib = UINib(nibName: name, bundle: Bundle(for: cellClass))
        self.register(nib, forCellReuseIdentifier: String(describing: cellClass.self))
    }
}
