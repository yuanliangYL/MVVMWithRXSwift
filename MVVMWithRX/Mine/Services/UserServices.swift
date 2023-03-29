//
//  UserServices.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/28.
//  处理重VM中抽离出来的业务逻辑:Service层通常用于处理网络请求、数据存储和其他与业务逻辑相关的操作
//  在MVVM架构中添加Service层的一般步骤，通过Service层，我们可以将业务逻辑从ViewModel中解耦，从而提高代码的可维护性和可测试性

import Foundation
import RxSwift


//如果这里存在APP内多个地方共享，可以考虑用单例实现
class UserServices{
    
    //模拟获取用户数据
    func getUserinfo()->Observable<[String:Any]?>{
         return Single.create{ single in
             let data = ["name":"jessica",
                         "age":20]
             single(.success(data))

             return Disposables.create {}
         }.asObservable()
    }


    //模拟获取用户数据
    func updataUserinfo()->Observable<[String:Any]?>{
         return Single.create{ single in
             let data = ["name":"teayan",
                         "age":25]
             single(.success(data))
             return Disposables.create {}
         }.asObservable()
    }

    //更新名称
    func updateName(name:String,origin:UserModel)->Observable<UserModel>{
        return Single.create{ single in
            let info = origin
            info.name = name
            single(.success(info))
            return Disposables.create {}
        }.asObservable()
    }

 // MARK: -- 数据信息的增删改查


}
