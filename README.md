##### 前言
###### 本篇文章权当笔记, 主要是在制作SDK的时候, 需要配置很多基础的字段, 十分容易忘记. 文章末尾会介绍当前文章的不足,以及下一个版本需要添加的功能.本篇都是在讲如何创建一个属于自己的SDK, 至于SDK的代码规范,注释规范等之后会在下一篇进一步介绍.
-  打开Xcode, 新建工程, 选择Cocoa Touch Framework, 点击next.
![创建framework.png](https://upload-images.jianshu.io/upload_images/1659233-bf6912e3d2637b9d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 新建封装的功能类MZRobotApi类, 并实现其自定义的方法(方法可下载**[demo](https://github.com/WilliamAlex/SDK.git)**查看)


- 完成制作SDK的基础配置:
![基础配置.png](https://upload-images.jianshu.io/upload_images/1659233-c1c45743d521716c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```objc
3.1, 在TARGETS下选中工程->Build Setting->搜索linking.
3.2, 将Link With Standard Libraries设置为NO. 目的是为了避免重复链接.
3.3, Dead Code Stripping设置为NO, 如果开启此项就会对代码中的”dead”、”unreachable”的代码过滤, 不过这个开关是否关闭，似乎没有多大影响, 一般framework的制作过程中选择关闭.
3.4, 将Mach-O Type设为Static Library, framework可以是动态库也可以是静态库，对于系统的framework是动态库，而用户制作的framework只能是静态库。
```   
- 添加armv7s
![添加armv7s.png](https://upload-images.jianshu.io/upload_images/1659233-42d8181e9956cea5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
>在Architectures 中添加armv7s ,armv7s属于ARM处理器的指令集, 添加armv7s Xcode会自动生成一个二进制包.(具体解释可查看: **[armv7s等指令集详解](https://www.jianshu.com/p/3fce0bd6f045)**)

- 设置Headers, 将需要公开的文件拖至Public下, 隐藏的拖至Private或者Project下. 隐藏的头文件就无法再被引用.
![选择需要公开的头文件.png](https://upload-images.jianshu.io/upload_images/1659233-02ca1fc6c5170555.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 然后在MZRobotSDK.h 中引入公开的头文件, 只能引入公开的头文件.
![导入需要公开的头文件](https://upload-images.jianshu.io/upload_images/1659233-4f01aa870dab072b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 打包: 我只学会了手动打包的方式, 至于脚本打包, 暂时没有学习, 业余时间再去学习.
> 选中模拟器，编译程序command + B, 
选中测试机，编译程序command + B

![编译后生成的SDK.png](https://upload-images.jianshu.io/upload_images/1659233-416a4bb26c450d73.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
> 注意: 此时finder中找到framework文件, 刚编译完成的两个操作后会分别生成Debug-iphoneos（真机)和Debug-iphonesimulator(模拟器)两个文件. 我们需要将两个文件合并起来.

- 合并: 通过终端命令将两个framework合为一个模拟器和真机都可使用的framework。打开终端，输入lipo -create命令将Debug-iphoneos下FrameworkTest.framework目录下的FrameworkTest文件.拖拽到终端中，会自动有空格。然后将Debug-iphonesimulator下FrameworkTest.framework目录下的FrameworkTest文件拖拽进来，也会自动有空格，然后输入 -output，敲空格，在引入一个新的路径。最后敲回车，这样就合并了.
![合并后需要将新生成的SDK替换旧的SDK.png](https://upload-images.jianshu.io/upload_images/1659233-0bc476e1ce489214.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 用合并后的新文件替换掉旧文件
![直接复制过去就可以使用.png](https://upload-images.jianshu.io/upload_images/1659233-b052536bc8a90729.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 调用

![调用方式.png](https://upload-images.jianshu.io/upload_images/1659233-322748c9bfb07931.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


> 注意事项: 
1, 命令行: lipo -create 真机FrameworkTest路径  模拟器FrameworkTest路径 -output 新文件夹路径.
2, 合并后生成的新文件是.lipo后缀的, 我们不需要这个后缀, 将后缀删除掉后, 替换framework中的文件, 替换后将framework拷贝出来, 直接拖进新项目, 引入头文件即可使用.

- 下一篇文章需要添加的功能:
```objc
1, framework中添加图片资源bundle
2, 添加第三方依赖
3, 使项目支持cocoapods导入
4, 详细介绍SDK的代码规范以及注释规范
```
-  ### 总结
##### "不积跬步, 无以至千里", 希望每天都有一点进步. 





