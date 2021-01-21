
## 1.安装
#### 方式一：使用CocoaPods
```
pod 'LYAlertView'
```
#### 方式二：手动导入
- 将`LYAlertView`文件夹中的所有源代码拽入项目中
- 直接调用
## 2.调用示例
```
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
                .maskAlpha(0.6)
                .showAnimation(.shakeFromTop, 0.5)
                .hideAnimation(.shakeToTop, 0.5)
                .build()
  alert?.show()
```
## 3.效果展示
![1](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/8c86df424b5742ab888389217ce17472~tplv-k3u1fbpfcp-watermark.image)
![2](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/93670f55f100444c8decd88149ebed70~tplv-k3u1fbpfcp-watermark.image)
![3](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/896cd5fc9df24e05b6f4191956fa4935~tplv-k3u1fbpfcp-watermark.image)
![4](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b455687449e94abab5653d0201f7c976~tplv-k3u1fbpfcp-watermark.image)
