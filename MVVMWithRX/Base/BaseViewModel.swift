//
//  BaseViewModel.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/28.
/**
 MVVM项目的目录结构可能因具体项目而异，但通常遵循以下一般约定。

 Models
 Models目录包含应用程序的所有模型类，例如数据库模型、网络响应模型和视图模型。这些类通常被设计为只包含数据，不应该包含任何与UI相关的逻辑。

 Views
 Views目录包含应用程序的所有视图类，例如UIView和UIViewController的子类。这些类通常只负责呈现UI元素和响应用户输入，它们应该尽可能轻量级。

 ViewModels
 ViewModels目录包含应用程序的所有视图模型类，这些类包含了将模型数据转换为视图所需的状态和行为。ViewModels应该尽量独立于UI层，它们通常包含了处理业务逻辑、调用模型方法以及处理UI事件的代码。

 Services
 Services目录包含应用程序的所有服务类，例如网络服务、数据存储服务和第三方API服务。这些类负责与外部系统进行通信，并提供将外部数据转换为模型对象的方法。

 Utils
 Utils目录包含应用程序的所有实用程序类和函数，例如常量定义、工具函数和扩展类。这些类和函数可以被整个应用程序的不同部分使用，通常不包含任何与业务逻辑相关的代码。

 Resources
 Resources目录包含应用程序的所有静态资源，例如图像、字体、本地化字符串和storyboards文件等。

 以上是一个基本的MVVM项目结构示例，具体实现可能会因项目而异。目录结构的设计应该是可扩展的和易于理解的，有助于开发人员快速定位代码和文件。
 */

import UIKit

@objc protocol BaseViewModelProtocol{
    //请求数据信息
    @objc optional func requestDatas(page:Int,length:Int)
}

class BaseViewModel: NSObject,BaseViewModelProtocol{
    var page:Int = 1
    var length:Int = 10

    
    func requestDatas(page: Int = 1, length: Int = 10) {
        print(#function,"for page---\(page),and length---\(length)")

    }
}
