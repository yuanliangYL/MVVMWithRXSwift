//
//  UITableView+Register.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/29.
//

import Foundation
import UIKit

extension UITableView {

    /// 通过nib注册cell
    /// - Parameters:
    ///   - cellType: cell类型
    ///   - bundle: bundle
    func register<T: UITableViewCell>(_ cellType: T.Type, bundle: Bundle? = Bundle.main) {
        let nib = UINib(nibName: String(describing: cellType), bundle: bundle)
        let identifier = String(describing: cellType)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}
