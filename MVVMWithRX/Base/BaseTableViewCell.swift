//
//  BaseTableViewCell.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/29.
//

import UIKit
import RxSwift
class BaseTableViewCell: UITableViewCell {

    var disposeBag = DisposeBag()

    //cell信号重复订阅问题处理
    //销毁垃圾袋交给cell自身,在prepareForReuse 响应的时候，销毁垃圾袋重置
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
