//
//  UserViewModel.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/28.
//

import UIKit
import RxCocoa
import NSObject_Rx
class UserViewModel: BaseViewModel {

    //在ViewModel中使用Service
    /**
     我们注入PersonService作为ViewModel的一个依赖项，并使用它来获取Person列表。
     一旦我们获取到Person列表，我们可以将其存储在ViewModel中并使用数据绑定将其更新到View中。
     */
    var userService:UserServices = UserServices()
    //用户
    var userinfo = BehaviorRelay(value: UserModel())


    //获取数据
    override func requestDatas(page: Int = 1, length: Int = 10) {
        //业务逻辑
        userService.getUserinfo().subscribe { res in
            //数据处理
            guard let data = UserModel.deserialize(from: res) else{
                return
            }
            //外部发送
            self.userinfo.accept(data)
        }.disposed(by: rx.disposeBag)
    }

    //更新数据
    func updateuserInfo(){
        print(#function)
        userService.updataUserinfo().subscribe { res in
            //数据处理
            guard let data = UserModel.deserialize(from: res) else{
                return
            }
            //外部发送
            self.userinfo.accept(data)
        }.disposed(by: rx.disposeBag)
    }
}
