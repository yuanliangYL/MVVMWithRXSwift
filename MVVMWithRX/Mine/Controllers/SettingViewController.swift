//
//  SettingViewController.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/28.
//

import UIKit
import RxSwift
import RxGesture
class SettingViewController: BaseViewController {

    var userVM:UserViewModel?

    @IBOutlet weak var sureChange: UIButton!
    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func bind() {


        userVM?.userinfo.subscribe {[weak self] user in
            self?.name.text = user.element?.name
        }.disposed(by: rx.disposeBag)


        //输入框状态与按钮绑定
        name.rx.text
            .orEmpty
            .asObservable()
            .map{ $0.count >= 10}
            .bind(to: sureChange.rx.isEnabled)
            .disposed(by: rx.disposeBag)


        sureChange.rx.tapGesture()
            .when(.recognized)
            .throttle(.seconds(3), scheduler: MainScheduler.instance)
            .subscribe {[weak self] _ in
                self?.userVM?.updateName(name: self?.name.text ?? "")
                self?.navigationController?.popViewController(animated: true)
            }.disposed(by: rx.disposeBag)

    }

}
