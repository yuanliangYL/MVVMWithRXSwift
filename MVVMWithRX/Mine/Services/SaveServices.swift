//
//  SaveServices.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/29.
//

import Foundation
import RxSwift

class SaveServices{


    func getSaveList()->Observable<[SaveModel]>{
        return Single.create{ single in
            var datas:[SaveModel] = []
            for i in 0...30{
                let save = SaveModel()
                save.name = "name----name---name--name\(i)"
                save.time = "time\(i)"
                save.title = "title---title--title--title\(i)"
                save.logo = "logo\(i)"
                datas.append(save)
            }
            single(.success(datas))
            return Disposables.create {}
        }.asObservable()
   }


    func updateWith(){

    }
}
