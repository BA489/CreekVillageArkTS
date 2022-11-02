# 转场动画的使用（ArkTS）

### 简介

基于Stage模型的转场动画接口，实现一系列页面动画切换的场景。在本教程中，我们将会通过一个简单的样例，学习如何使用ArkTS开发框架的转场动画。其中包含页面间转场、组件内转场以及共享元素转场，完成效果如下图所示：

![image](screenshots/device/1.gif)

### 相关概念

**[页面间转场](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-page-transition-animation-0000001281201178)：**页面转场通过在全局pageTransition方法内配置页面入场组件和页面退场组件来自定义页面转场动效。

**[组件内转场](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-transition-animation-component-0000001281001270)：**组件转场主要通过transition属性进行配置转场参数，在组件插入和删除时进行过渡动效，主要用于容器组件子组件插入删除时提升用户体验（需要配合animateTo才能生效，动效时长、曲线、延时跟随animateTo中的配置）。

**[共享元素转场](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-transition-animation-shared-elements-0000001281480730)：**通过修改共享元素的sharedTransition属性设置元素在不同页面之间过渡动效。例如，如果两个页面使用相同的图片（但位置和大小不同），图片就会在这两个页面之间流畅地平移和缩放。

### 相关权限

不涉及

### 使用说明

1. 在Index页面，点击**页面间转场：底部滑入**按钮，BottomTransition页面以底部切入的动画形式切入，并显示图片内容。
2. 在Index页面，点击**页面间转场：自定义1**按钮，CustomTransition页面以自定义1的动画形式切入，并显示图片内容。
3. 在Index页面，点击**页面间转场：自定义2**按钮，FullCustomTransition页面以自定义1的动画形式切入，并显示图片内容。
4. 在Index页面，点击**组件内转场**按钮，在ComponentTransition页面点击**Toggle**按钮，页面内元素以动画形式切入。
5. 在Index页面，点击**共享元素转场**按钮，在ShareItem页面点击图片，SharePage页面从原图位置放大显示，点击返回按钮，SharePage从原图位置消失。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio  3.1 Canary1及以上版本进行编译运行。
4. 本示例运行时需要在DevEco Studio的entry模块中的Run/Debug Configurations设置项中勾选Deploy Multi Hap Packages。