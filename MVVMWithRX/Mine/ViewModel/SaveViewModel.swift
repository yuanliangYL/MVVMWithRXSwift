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
        let saves = savelist.value
        let save = saves[indexPath.row]
        let time = Date().timeIntervalSince1970
        save.name = "nannana-\(time)"
        save.time = "\(time)"
        self.savelist.accept(saves)
    }

}
