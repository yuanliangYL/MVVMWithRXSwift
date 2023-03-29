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
    func requestData()
}


class BaseViewController: UIViewController,BaseViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()

        requestData()
    }

    func setupUI() {
        print(#function)
    }

    func bind() {
        print(#function)
    }

    func requestData() {
        print(#function)
    }

    deinit{
        print(#function,self)
    }

}
