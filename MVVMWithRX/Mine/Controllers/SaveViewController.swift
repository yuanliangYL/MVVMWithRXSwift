//
//  CollectionViewController.swift
//  MVVMWithRX
//
//  Created by AlbertYuan on 2023/3/29.
//

import UIKit

class SaveViewController: BaseViewController {

    @IBOutlet weak var tableview: UITableView!

    

    var datas:[SaveModel] = []
    var saveVM = SaveViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func setupUI() {
        tableview.register(SaveTableViewCell.self)
    }

    override func bind() {

        saveVM.savelist.subscribe {[weak self] datas in
            self?.datas = datas
            self?.tableview.reloadData()
        }.disposed(by: rx.disposeBag)
    }

    override func requestData() {
        saveVM.requestDatas()
    }
}

extension SaveViewController:UITableViewDataSource,UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:SaveTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SaveTableViewCell", for: indexPath) as! SaveTableViewCell
        cell.data = self.datas[indexPath.row]

        //把主动销毁的能力收回，销毁垃圾袋交给我们的cell.disposeBag,在我们重用响应的时候，及时销毁，重置！
        cell.logGesture.subscribe { data in
            print("log data is :\(String(describing: data.element?.name))")
            //执行具体操作
        }.disposed(by: cell.disposeBag)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        saveVM.updateWith(indexPath: indexPath)
    }

}
