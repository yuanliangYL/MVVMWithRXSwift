//
//  MineViewController.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/28.
//

import UIKit
import RxSwift
class MineViewController: BaseViewController {

    //controller持有View
    var userinfo:UserInfomationView! = UserInfomationView.loadFromNib()
    var userVM:UserViewModel! = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillLayoutSubviews() {
        userinfo.frame = view.bounds
    }

    //UI构建
     override func setupUI(){
        view.addSubview(userinfo)
    }

    //数据绑定双向绑定
    override func bind(){
        // MARK: -- 新版
        userVM.userinfo.bind(to: userinfo.model).disposed(by: rx.disposeBag)

        updateInfo()

        gotoSeeting()

        gotoSave()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userVM.requestDatas()
    }
}

extension MineViewController{

    func updateInfo(){
        //视图层抛出事件的真实处理
        userinfo.updateGesture
            .subscribe { [weak self] _ in
                print(Thread.current)
            self?.userVM.updateuserInfo()
        }.disposed(by: rx.disposeBag)
    }


    func gotoSeeting(){
        userinfo.openGesture.subscribe { [weak self] _ in
            //事件处理:这里使用URLnavigator改进
            let setting = SettingViewController()
            setting.userVM = self?.userVM
            self?.navigationController?.pushViewController(setting, animated: true)
        }.disposed(by: rx.disposeBag)
    }


    func gotoSave(){
        userinfo.saveGesture.subscribe { [weak self] _ in

            //事件处理:这里使用URLnavigator改进
            let save = SaveViewController()
            self?.navigationController?.pushViewController(save, animated: true)

            
        }.disposed(by: rx.disposeBag)
    }
}


/**
 // MARK: -- 旧版
         //实现双向绑定VM--->View
 //        userVM.userinfo.subscribe { [weak self] user in
 //            guard let ur = user.element else {return}
 //            self?.userinfo.nameLabel.text = ur.name
 //            self?.userinfo.ageLabel.text = "\(ur.age)"
 //        }.disposed(by: rx.disposeBag)
         //通过bind方法，将UI赋值操作交付给View层

         //View---->VM
 //        userinfo.updateBtn.rx.tapGesture()
 //            .when(.recognized)
 //            .throttle(.seconds(2), scheduler: MainScheduler.instance)
 //            .subscribe {[weak self] _ in
 //                //事件处理
 //                self?.userVM.updateuserInfo()
 //        }.disposed(by: rx.disposeBag)
 //
 //        //View---->VM
 //        userinfo.gosettingBtn.rx.tapGesture()
 //            .when(.recognized)
 //            .throttle(.seconds(2), scheduler: MainScheduler.instance)
 //            .subscribe {[weak self] _ in
 //                //事件处理:这里使用URLnavigator改进
 //                let setting = SettingViewController()
 //                setting.userVM = self?.userVM
 //                self?.navigationController?.pushViewController(setting, animated: true)
 //        }.disposed(by: rx.disposeBag)
 **/
