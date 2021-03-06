//
//  ViewController.swift
//  WangSwift
//
//  Created by swift on 2017/9/11.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var baseTableView: UITableView!
    let myTableViewReuseIdentifer = "myTableViewReuseIdentifer"
    var itemList = ["基础UI图形", "原生网络请求", "Alamofire + SwiftyJSON使用", "swift原生约束布局", "swift调用OC方法", "SnapKit使用方法", "Kingfisher使用方法"]
    var syntaxList = ["闭包"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .groupTableViewBackground
        self.makeUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- 创建界面
    func makeUI() {
        self.baseTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 40), style: .plain)
        self.baseTableView.delegate = self
        self.baseTableView.dataSource = self
        self.baseTableView.register(UITableViewCell.self, forCellReuseIdentifier: myTableViewReuseIdentifer)
        self.baseTableView.separatorStyle = .singleLine
        self.baseTableView.tableFooterView = UIView()
        self.view.addSubview(self.baseTableView)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textColor = .black
        label.text = (section == 0) ? "项目" : "语法"
        return label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //MARK: 列表协议
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? itemList.count : syntaxList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: myTableViewReuseIdentifer, for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: myTableViewReuseIdentifer)
        }
        cell?.textLabel?.text = (indexPath.section == 0) ? itemList[indexPath.row] : syntaxList[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let vc = WangUIViewController()
                vc.hidesBottomBarWhenPushed = true
                weak var WeakSelf = self
                vc.myButtonClosures = { (text, text2) -> () in
                    //重新获取strong self
                    let strSelf = WeakSelf
                    strSelf?.itemList[0] = text
                    strSelf?.baseTableView.reloadData()
                    print("多余的参数：\(text2)")
                }
                self.navigationController?.pushViewController(vc, animated: true)
            } else if indexPath.row == 1 {
                let vc = WangNetViewController()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            } else if indexPath.row == 2 {
                let vc = WangAlamofireAndSwiftyJSONViewController()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            } else if indexPath.row == 3 {
                let vc = WangAutolayoutViewController()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            } else if indexPath.row == 4{
                let vc = WangOCBridgingViewController()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            } else if indexPath.row == 5 {
                let vc = WangSnapKitViewController()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            } else if indexPath.row == 6 {
                let vc = WangKingfisherViewController()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
            break;
        case 1:
            switch indexPath.row {
            case 0:
                let vc = WangClosures()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
                break;
            default:
                break;
            }
            break
        default:
            break;
        }
    }

    
    //FIXME: 代替#warning,有bug或优化
    //TODO: 日程提醒：今天先到这吧
    
}

