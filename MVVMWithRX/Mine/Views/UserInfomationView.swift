//
//  UserInfomationView.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/28.
//  视图UI

import UIKit
import RxGesture
import RxSwift

class UserInfomationView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var gosettingBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
