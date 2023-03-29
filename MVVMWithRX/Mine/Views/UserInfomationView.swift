//
//  UserInfomationView.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/28.
//  视图UI

import UIKit
import RxGesture
import RxSwift
import NSObject_Rx

class UserInfomationView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var gosettingBtn: UIButton!

    //数据更新手势操作
    var updateGesture = PublishSubject<Bool>()
    //页面跳转
    var openGesture = PublishSubject<Bool>()

    override func awakeFromNib() {
        super.awakeFromNib()
        initGestureAction()
    }

    //UI相关操作内置与View层中，实现独立,即使整个模块剥离出去也能最大程度适配
    //思考：这种方式在复用机制下会出现什么问题？
    func initGestureAction(){
        //View---->VM
        updateBtn.rx.tapGesture()
            .when(.recognized)
            .throttle(.seconds(2), scheduler: MainScheduler.instance)
            .subscribe {[weak self] _ in
                //事件处理
                self?.updateGesture.onNext(true)
        }.disposed(by: rx.disposeBag)

        //View---->VM
        gosettingBtn.rx.tapGesture()
            .when(.recognized)
            .throttle(.seconds(2), scheduler: MainScheduler.instance)
            .subscribe {[weak self] _ in
                self?.openGesture.onNext(true)
        }.disposed(by: rx.disposeBag)
    }
}

extension UserInfomationView{
    //实现绑定数据复制：思考如何将usermodel模型层剥离出去
    public var model:Binder<UserModel>{
        return Binder(self){ _,data in
            self.nameLabel.text = data.name
            self.ageLabel.text = "\(data.age)"
        }
    }
}
