# YSYRouter

[![CI Status](https://img.shields.io/travis/muxueChen/YSYRouter.svg?style=flat)](https://travis-ci.org/muxueChen/YSYRouter)
[![Version](https://img.shields.io/cocoapods/v/YSYRouter.svg?style=flat)](https://cocoapods.org/pods/YSYRouter)
[![License](https://img.shields.io/cocoapods/l/YSYRouter.svg?style=flat)](https://cocoapods.org/pods/YSYRouter)
[![Platform](https://img.shields.io/cocoapods/p/YSYRouter.svg?style=flat)](https://cocoapods.org/pods/YSYRouter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

YSYRouter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YSYRouter'
```
## 基础用法
### [献上 Demo](http://chenxueming@114.55.74.197/chenxueming/YSYRouter.git)，先看一下demo的目录
![屏幕快照 2019-03-19 下午4.29.35.png](https://upload-images.jianshu.io/upload_images/4639197-b0a98db165f0b0b5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

其中 B、goods、TabBarController 都是独立的组件，每一个组件都有一个对外开放的 Service.h，在 Service.h 中声明 组件对外开放的协议，在 Service.h 中声明一个类遵守这个协议，并实现协议方法。

### 创建组件
![屏幕快照 2019-03-19 下午5.09.43.png](https://upload-images.jianshu.io/upload_images/4639197-003cc5e5c3ee2953.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

上图所示为 B 文件夹代表一个独立的组件。
#### 声明组件协议
![屏幕快照 2019-03-19 下午5.57.59.png](https://upload-images.jianshu.io/upload_images/4639197-8f523564564b51e2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如上图所示，BServiceProtocol 协议是 B 组件对外开放的协议，便于其他组件在调用 B 组件的时候查看。

- 协议命名规范： 组件名 + ServiceProtocol。我这里是 BServiceProtocol

注释规范：
1. 协议头的注释，需要加组件的路由（如果不加这行注释，别的组件咋知道怎么过来）；
2. 方法注释使用文档注释，方法的功能给描述清楚。越详细越好。

#### 组件服务实现类
![屏幕快照 2019-03-19 下午5.18.55.png](https://upload-images.jianshu.io/upload_images/4639197-4e4f7abdee8550ba.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

1. 声明一个类，并遵守该组件服务协议。

2. 实现 YSYComponentInterfaceProtocol 协议中的默认属性 routerParameter 与 routerCallBack。

3. 注册组件，重写实现类的 + (void)load 方法，注册该组件，这里注册组件的路由地址需要跟该组件服务协议头部的注释保持一致。路由规则：
1. 注册路由的规范：scheme://host/module
2. 适配旧的路由可以使用：scheme://module

4. 实现组件协议中的方法，方法参数跟属性 routerParameter 内容是一致的，在方法内部使用参数的时候需要执行 copy 操作，不然该组件被其他组件调用的时候属性值会发生改变，routerCallBack 属性也是同样的道理。
5. 方法内部的实现逻辑我不管，你自己想怎么实现怎么实现

### 调用组件服务
在 Demo 工程的 YSYViewController 中有具体的实现，我这里做个简单的介绍。
#### 通过路由直接调用
1. 引入头文件
```
#import "YSYRouterServiceManager.h"
```
2. 跳转到目标组件的页面

2.1. push 跳转（默认）
```
[YSYRouterServiceManager openUrlString:@"bsd://xxyp/B/home?a=1" parameter:nil callBack:nil];
```
2.2. present 跳转
```
[YSYRouterServiceManager openUrlString:@"bsd://xxyp/B/login" jumpType:YSYRouterServiceJumpTypePresent parameter:nil callBack:nil];
```
3. 调用组件开放的接口（也可以说成是服务或者方法）。回调的是同步的还是异步的，取决于目标组件的实现。

```
id obj = [YSYRouterServiceManager openUrlString:@"bsd://xxyp/B/getUserInfo?a=1" parameter:nil callBack:^(id response) {
//回调结果
NSLog(@">>>>%@",response);
}];
```
发送服务的
如果是同步的回调在方法的返回值中也可以去到（我这里还有点小bug，返回值可以是任意类型的对象）。
## 实现思想
此组件化方案满足黑盒理论，消息发送方只管发送消息，消息接收方只管接收消息，发送方与接收方不存在任何依赖关系。所有的组件都依赖于 YSYRouter 中间件。YSYRouter 负责维护一张路由表(表里的内容为<url:class>),当程序启动的时候每个组件完成自注册，把组件服务挂在到路由中心。单个组件只需要暴露一个 protocol 提供其他组件调用参考，实现部分全部隐藏在组件内部。
### 架构
![屏幕快照 2019-03-19 下午7.04.00.png](https://upload-images.jianshu.io/upload_images/4639197-6aa2b1d85f60d469.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 特性
1. 一行代码搞定通信

2. 异步回调

3. 组件缓存

4. 模糊匹配

5. 错误处理


> 如果大佬有发现哪些地方设计得不妥的或者有 bug 可以联系我微信:zhuqi0801，也可以邮件给我:15757043783@163.com
## Author

muxueChen, 1391801900@qq.com

## License

YSYRouter is available under the MIT license. See the LICENSE file for more info.
