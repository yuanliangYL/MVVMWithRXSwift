//
//  SaveTableViewCell.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/29.
//

import UIKit
import RxSwift
import RxRelay

class SaveTableViewCell: BaseTableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var logInfoBtn: UIButton!

    //手势
    //数据更新手势操作
    var logGesture = PublishSubject<SaveModel>()

    override func awakeFromNib() {
        super.awakeFromNib()
        initGestureAction()
    }

    func initGestureAction(){
        logInfoBtn.rx.tapGesture()
            .when(.recognized)
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe {[weak self] _ in
                guard let data = self?.data else { return }
                //事件处理
                self?.logGesture.onNext(data)
        }.disposed(by: rx.disposeBag)
    }

    var data:SaveModel!{
        didSet{
            logo.text = data.logo
            time.text = data.time
            name.text = data.name
            title.text = data.title
        }
    }
}


