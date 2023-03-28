//
//  BaseViewController.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/28.
//

import UIKit

protocol BaseViewControllerProtocol {
    func setupUI()
    func bind()
}


class BaseViewController: UIViewController,BaseViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }

    func setupUI() {
        print(#function)
    }

    func bind() {
        print(#function)
    }

    deinit{
        print(#function,self)
    }

}
