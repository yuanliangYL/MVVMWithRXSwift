//
//  SaveViewModel.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/29.
//

import UIKit
import RxSwift
import RxRelay

class SaveViewModel: BaseViewModel {
    var saveService:SaveServices = SaveServices()
    //用户
    var savelist = BehaviorRelay(value: [SaveModel]())

    override func requestDatas(page: Int = 1, length: Int = 10) {
        saveService.getSaveList().subscribe {[weak self] datas in
            self?.savelist.accept(datas)
        }.disposed(by: rx.disposeBag)
    }


    func updateWith(indexPath: IndexPath){
        saveService.updateWith(indexPath: indexPath, withOrigin: savelist.value)
            .subscribe {[weak self] datas in
            self?.savelist.accept(datas)
        }
    }

}
