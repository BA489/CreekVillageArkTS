# ArkUI 常用布局容器对齐方式

### 简介

基于ArkUI框架，实现 Flex、Column、Row 和 Stack 四种常用布局容器对齐方式。

### 相关概念

主轴：在Flex容器内可设置主轴方向，当主轴方向设置为Column时，主轴方向为水平方向，当设置为Row时，主轴方向为垂直方向。Stack容器属于堆叠容器没有主轴方向
交叉轴：在同一平面内与主轴方向垂直的方向即为交叉轴方向

### 相关权限

不涉及

### 使用说明

1. 在主界面有四个容器模块，分别时Flex，Column，Row和Stack，点击不同的容器模块，则会跳转到该容器对齐方式属性设置和子组件显示界面
2. 在第二个界面有不同的属性单选框列表，选择不同的对齐方式，容器内子组件对齐方式回发生改变


### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API Version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Canary1及以上版本进行编译运行。
4. 本示例运行时需要在DevEco Studio的entry模块中的Run/Debug Configurations设置项中勾选Deploy Multi Hap Packages。