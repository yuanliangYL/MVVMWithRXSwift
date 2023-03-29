//
//  UIView+LoadNib.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/29.
//

import Foundation
import UIKit

extension UIView {

    //简化视图加载方法
    static func loadFromNib<T: UIView>() -> T {
        let nibName = String(describing: self)
        guard let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
    
}
