//
//  ViewController.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2021/1/4.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let cellid = "cell"
    
    
    var dataArr = [
        "默认alpha动画",
        "缩放动画",
        "顶部掉落弹性动画",
        "底部弹出弹性动画",
        "左侧弹出弹性动画",
        "右侧弹出弹性动画",
        "顶部靠左掉落动画",
        "顶部靠右掉落动画"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "LYAlertViewDemo"
        view.addSubview(tableView)
    }
    
    lazy var tableView : UITableView = {
        let table = UITableView.init(frame: CGRect(x: 0, y: 0, width: LYCommonSet.Kwidth, height: LYCommonSet.Kheith), style: .plain)
        table.backgroundColor = LYCommonSet.RGBA(r: 245, g: 245, b: 245, a: 1)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        table.tableFooterView = UIView()
        return table
    }()
    
    func click(_ sender: UIButton) {
        
        let item1 = LYAlertFactory()
            .creatAlertShowItem(.title, "温馨提示")
            .fontSize(17)
//            .line(UIColor.lightGray, 0.5)
            .titleColor(UIColor.orange)
//        let item2 = LYAlertFactory()
//            .creatAlertShowItem(.content, "是否确认向老师发起一对一错题辅导请求")
//            .fontSize(16)
//            .line(UIColor.lightGray, 0.5)
//            .titleColor(UIColor.darkGray)
//            .textAlignment(.center)
//        
        let item3 = LYAlertFactory()
            .creatAlertInteractiveItem("帅的无敌")
            .fontSize(15)
            .titleColor(UIColor.darkGray)
//            .btnRadius(5)
            .btnHeight(30)
            .btnMarin(10)
            .line(UIColor.lightGray, 0.5, .bottom)

//            .btnBackgroundColor(UIColor.red)
            .action{
            print("屌")
        }
        let item2 = LYAlertFactory()
            .creatAlertShowItem(.content, "是否确认向老师发起一对一错题辅导请求")
            .fontSize(16)
            .line(UIColor.lightGray, 0.5)
            .titleColor(UIColor.darkGray)
            .textAlignment(.center)

        let item4 = LYAlertFactory()
            .creatAlertInteractiveItem("我再想想")
            .fontSize(15)
            .btnHeight(30)
            .btnMarin(10)
            .titleColor(UIColor.gray)
            .line(UIColor.lightGray, 0.5, .left)

//            .btnRadius(5)
//            .btnBackgroundColor(UIColor.red)
            .action{
            print("屌")
        }
        let item5 = LYAlertFactory()
            .creatAlertInteractiveItem("确认发起")
            .fontSize(15)
            .btnHeight(30)
            .btnMarin(10)
            .titleColor(UIColor.cyan)
            .action{
            print("牛")
        }
        let alert = LYAlertBuilder.init(nil, item2, [item4,item5])
            .cornerRadius(15)
            .maskAlpha(0.3)
            .showAnimation(.shakeFromBottom, 0.5)
            .hideAnimation(.shakeToBottom, 0.5)
            .build()
        alert?.show()
    }
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
        cell.textLabel?.text = dataArr[indexPath.row]
        cell.backgroundColor = UIColor.white
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            let item1 = LYAlertFactory()
                .creatAlertShowItem(.title, "温馨提示")
                .fontSize(17)
                .titleColor(UIColor.darkGray)
            let item2 = LYAlertFactory()
                .creatAlertShowItem(.content, "是否确认向老师发起一对一错题辅导请求？")
                .fontSize(16)
                .titleColor(UIColor.darkGray)
                .line(UIColor.lightGray, 0.5)
            let item3 = LYAlertFactory()
                .creatAlertInteractiveItem("我再想想")
                .fontSize(15)
                .btnHeight(30)
                .btnMarin(10)
                .titleColor(UIColor.gray)
                .line(UIColor.lightGray, 0.5, .left)
                .action {
                     print("我再想想")
                }
            let item4 = LYAlertFactory()
                .creatAlertInteractiveItem("确认发起")
                .fontSize(15)
                .btnHeight(30)
                .btnMarin(10)
                .titleColor(UIColor.brown)
                .line(UIColor.lightGray, 0.5, .left)
                .action {
                    print("确认发起")
                }
            let alert = LYAlertBuilder.init(item1, item2, [item3,item4])
                .cornerRadius(15)
                .maskAlpha(0.4)
                .build()
            alert?.show()
        }else if indexPath.row == 1{
            let item2 = LYAlertFactory()
                .creatAlertShowItem(.content, "是否确认向老师发起一对一错题辅导请求？")
                .fontSize(16)
                .titleColor(UIColor.darkGray)
                .line(UIColor.lightGray, 0.5)
            let item3 = LYAlertFactory()
                .creatAlertInteractiveItem("我再想想")
                .fontSize(15)
                .btnHeight(30)
                .btnMarin(10)
                .titleColor(UIColor.gray)
                .line(UIColor.lightGray, 0.5, .left)
                .action {
                     print("我再想想")
                }
            let item4 = LYAlertFactory()
                .creatAlertInteractiveItem("确认发起")
                .fontSize(15)
                .btnHeight(30)
                .btnMarin(10)
                .titleColor(UIColor.brown)
                .line(UIColor.lightGray, 0.5, .left)
                .action {
                    print("确认发起")
                }
            let alert = LYAlertBuilder.init(nil, item2, [item3,item4])
                .cornerRadius(15)
                .maskAlpha(0.4)
                .showAnimation(.scale, 0.5)
                .hideAnimation(.scale, 0.5)
                .build()
            alert?.show()
        }else if indexPath.row == 2{
           
            let item1 = LYAlertFactory()
                .creatAlertShowItem(.title, "温馨提示")
                .fontSize(17)
                .titleColor(UIColor.darkGray)
            let item2 = LYAlertFactory()
                .creatAlertShowItem(.content, "是否确认向老师发起一对一错题辅导请求？")
                .fontSize(16)
                .titleColor(UIColor.darkGray)
                .line(UIColor.lightGray, 0.5)
            let item3 = LYAlertFactory()
                .creatAlertInteractiveItem("我再想想")
                .fontSize(15)
                .btnHeight(44)
                .btnMarin(15)
                .btnRadius(5)
                .btnBackgroundColor(UIColor.orange)
                .titleColor(UIColor.white)
                .line(UIColor.lightGray, 0.5, .left)
                .action {
                     print("我再想想")
                }
            let item4 = LYAlertFactory()
                .creatAlertInteractiveItem("确认发起")
                .fontSize(15)
                .btnRadius(5)
                .btnHeight(44)
                .btnMarin(15)
                .btnBackgroundColor(UIColor.orange)
                .titleColor(UIColor.white)
                .line(UIColor.lightGray, 0.5, .left)
                .action {
                    print("确认发起")
                }
            let alert = LYAlertBuilder.init(item1, item2, [item3,item4])
                .cornerRadius(15)
                .maskAlpha(0.6)
                .showAnimation(.shakeFromTop, 0.5)
                .hideAnimation(.shakeToTop, 0.5)
                .build()
            alert?.show()
        }else if indexPath.row == 3{
            
            let item1 = LYAlertFactory()
                .creatAlertShowItem(.title, "温馨提示")
                .fontSize(17)
                .line(UIColor.lightGray, 0.5)
                .titleColor(UIColor.darkGray)
            let item2 = LYAlertFactory()
                .creatAlertShowItem(.content, "是否确认向老师发起一对一错题辅导请求是否确认向老师发起一对一错题辅导请求是否确认向老师发起一对一错题辅导请求是否确认向老师发起一对一错题辅导请求是否确认向老师发起一对一错题辅导请求？")
                .fontSize(16)
                .textAlignment(.justified)
                .titleColor(UIColor.darkGray)
                .line(UIColor.lightGray, 0.5)
            let item3 = LYAlertFactory()
                .creatAlertInteractiveItem("我再想想")
                .fontSize(15)
                .btnHeight(44)
                .btnMarin(15)
                .btnRadius(5)
                .btnBackgroundColor(UIColor.orange)
                .titleColor(UIColor.white)
                .line(UIColor.lightGray, 0.5, .left)
                .action {
                     print("我再想想")
                }
            let item4 = LYAlertFactory()
                .creatAlertInteractiveItem("确认发起")
                .fontSize(15)
                .btnRadius(5)
                .btnHeight(44)
                .btnMarin(15)
                .btnBackgroundColor(UIColor.orange)
                .titleColor(UIColor.white)
                .line(UIColor.lightGray, 0.5, .left)
                .action {
                    print("确认发起")
                }
            let alert = LYAlertBuilder.init(item1, item2, [item3,item4])
                .cornerRadius(15)
                .maskAlpha(0.6)
                .showAnimation(.shakeFromBottom, 0.5)
                .hideAnimation(.shakeToTop, 0.5)
                .build()
            alert?.show()
        }else if indexPath.row == 4{
            let dic = [NSAttributedString.Key.kern:NSNumber.init(value: 15)]
            let item1 = LYAlertFactory()
                .creatAlertShowItem(.title, "温馨提示")
                .fontSize(17)
                .attribute(dic)
                .titleColor(UIColor.darkGray)
            let item2 = LYAlertFactory()
                .creatAlertShowItem(.content, "是否确认向老师发起一对一错题辅导请求？")
                .fontSize(16)
                .titleColor(UIColor.darkGray)
                .line(UIColor.lightGray, 0.5)
         
            let item4 = LYAlertFactory()
                .creatAlertInteractiveItem("确认发起")
                .fontSize(15)
                .btnRadius(5)
                .btnHeight(44)
                .btnMarin(15)
                .btnBackgroundColor(UIColor.orange)
                .titleColor(UIColor.white)
                .action {
                    print("确认发起")
                }
            let alert = LYAlertBuilder.init(item1, item2, [item4])
                .cornerRadius(15)
                .maskAlpha(0.6)
                .showAnimation(.shakeFromLeft, 0.5)
                .hideAnimation(.shakeToLeft, 0.5)
                .build()
            alert?.show()
        }else if indexPath.row == 5{
            let item1 = LYAlertFactory()
                .creatAlertShowItem(.title, "温馨提示")
                .fontSize(17)
                .titleColor(UIColor.darkGray)
            let item2 = LYAlertFactory()
                .creatAlertShowItem(.content, "是否确认向老师发起一对一错题辅导请求？")
                .fontSize(16)
                .titleColor(UIColor.darkGray)
                .line(UIColor.lightGray, 0.5)
            let item3 = LYAlertFactory()
                .creatAlertInteractiveItem("我再想想")
                .fontSize(15)
                .btnHeight(30)
                .btnMarin(10)
                .titleColor(UIColor.gray)
                .line(UIColor.lightGray, 0.5, .bottom)
                .action {
                     print("我再想想")
                }
            let item4 = LYAlertFactory()
                .creatAlertInteractiveItem("确认发起")
                .fontSize(15)
                .btnHeight(30)
                .btnMarin(10)
                .titleColor(UIColor.brown)
                .line(UIColor.lightGray, 0.5, .bottom)
                .action {
                    print("确认发起")
                }
            let item5 = LYAlertFactory()
                .creatAlertInteractiveItem("取消")
                .fontSize(15)
                .btnHeight(30)
                .btnMarin(10)
                .titleColor(UIColor.brown)
                .action {
                    print("取消")
                }
            let alert = LYAlertBuilder.init(item1, item2, [item3,item4,item5])
                .cornerRadius(15)
                .maskAlpha(0.4)
                .showAnimation(.shakeFromRight, 0.5)
                .hideAnimation(.shakeToLeft, 0.5)
                .build()
            alert?.show()
        }else if indexPath.row == 6{
            let item1 = LYAlertFactory()
                .creatAlertShowItem(.title, "温馨提示")
                .fontSize(17)
                .titleColor(UIColor.darkGray)
            let item2 = LYAlertFactory()
                .creatAlertShowItem(.content, "是否确认向老师发起一对一错题辅导请求？")
                .fontSize(16)
                .titleColor(UIColor.darkGray)
                .line(UIColor.lightGray, 0.5)
            let item3 = LYAlertFactory()
                .creatAlertInteractiveItem("我再想想")
                .fontSize(15)
                .btnHeight(44)
                .btnMarin(0)
                .itemBackgroundColor(UIColor.orange)
                .btnBackgroundColor(UIColor.clear)
                .titleColor(UIColor.white)
                .line(UIColor.gray, 0.5, .left)
                .action {
                     print("我再想想")
                }
            let item4 = LYAlertFactory()
                .creatAlertInteractiveItem("确认发起")
                .fontSize(15)
                .btnHeight(44)
                .btnMarin(0)
                .itemBackgroundColor(UIColor.orange)
                .titleColor(UIColor.white)
                .action {
                    print("确认发起")
                }
            let alert = LYAlertBuilder.init(item1, item2, [item3,item4])
                .cornerRadius(15)
                .maskAlpha(0.6)
                .showAnimation(.dropFromLeft, 0.5)
                .hideAnimation(.dropFromLeft, 0.5)
                .build()
            alert?.show()
        }else  if indexPath.row == 7{
            let item1 = LYAlertFactory()
                .creatAlertShowItem(.title, "温馨提示")
                .fontSize(17)
                .titleColor(UIColor.darkGray)
            let item2 = LYAlertFactory()
                .creatAlertShowItem(.content, "是否确认向老师发起一对一错题辅导请求？")
                .fontSize(16)
                .titleColor(UIColor.darkGray)
                .line(UIColor.lightGray, 0.5)
    
            let item4 = LYAlertFactory()
                .creatAlertInteractiveItem("确认发起")
                .fontSize(15)
                .btnHeight(44)
                .btnMarin(0)
                .itemBackgroundColor(UIColor.orange)
                .titleColor(UIColor.white)
                .action {
                    print("确认发起")
                }
            let alert = LYAlertBuilder.init(item1, item2, [item4])
                .cornerRadius(15)
                .maskAlpha(0.6)
                .showAnimation(.dropFromRight, 0.5)
                .hideAnimation(.dropFromRight, 0.5)
                .build()
            alert?.show()
        }
         
        
    }
    
}
