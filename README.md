# MXRouter

[![CI Status](https://img.shields.io/travis/暮雪/MXRouter.svg?style=flat)](https://travis-ci.org/暮雪/MXRouter)
[![Version](https://img.shields.io/cocoapods/v/MXRouter.svg?style=flat)](https://cocoapods.org/pods/MXRouter)
[![License](https://img.shields.io/cocoapods/l/MXRouter.svg?style=flat)](https://cocoapods.org/pods/MXRouter)
[![Platform](https://img.shields.io/cocoapods/p/MXRouter.svg?style=flat)](https://cocoapods.org/pods/MXRouter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MXRouter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MXRouter'
```
## 路由类图

![轻量级路由类图.jpg](https://upload-images.jianshu.io/upload_images/4639197-7953d300b51205bc.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 使用说明
### MXPageManger  界面跳转管理

### MXURLModel  url 解析模型类提供外部传入的URL解析工作，并把URL转化为MXRouter能处理的url

### UIViewController+MXRouter 实现对 UIViewController 类的扩展，并遵守 MXViewControlleProtocol 协议

###  MXViewControlleProtocol 协议，实现了该协议，无论是哪一种类，都可以当作界面来使用，前提条件是如果这个类不属于UIViewController的子类，得实现 协议方法

```ruby
+ (UIViewController *)viewControllerWithParameter:(NSDictionary *)parameter callBack:(MXCallBack)callback
```

## 路由工作流程
在续。。。
## Author

暮雪, 1391801900@qq.com

## License

MXRouter is available under the MIT license. See the LICENSE file for more info.
