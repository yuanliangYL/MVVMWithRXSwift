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

    override func setupUI() {
        //输入框状态与按钮绑定
        name.rx.text
            .orEmpty
            .asObservable()
            .map{ $0.count >= 10}
            .bind(to: sureChange.rx.isEnabled)
            .disposed(by: rx.disposeBag)

    }

    override func bind() {
        userVM?.userinfo.subscribe {[weak self] user in
            self?.updateInfo(name: user.element?.name)
        }.disposed(by: rx.disposeBag)

        sureChange.rx.tapGesture()
            .when(.recognized)
            .throttle(.seconds(3), scheduler: MainScheduler.instance)
            .subscribe {[weak self] _ in
                self?.changeName()
            }.disposed(by: rx.disposeBag)
    }
}


// MARK: -- 尽量将功能分离处理，满足功能单一原则
extension SettingViewController{
    //更新名称
    func updateInfo(name:String?){
        self.name.text = name
    }

    //修改名称
    func changeName(){
        self.userVM?.updateName(name: self.name.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
}
