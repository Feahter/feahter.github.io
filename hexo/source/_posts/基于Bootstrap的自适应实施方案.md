---
title: "基于Bootstrap的自适应实施方案"
date: 2016-11-28
categories:
- 术
tags:
- Bootstrap
- 自适应
---

bootstrap:意为引导，引导有杠杆的作用。在计算机用语中为引导程序的意思。
<!-- more -->
bootstrap:意为引导，引导有杠杆的作用。在计算机用语中为引导程序的意思。

很多人会对Bootstrap这个名字感到困惑。英语Bootstrap的意思是靴带，来自短语：“pull oneself up by one′s bootstrap”，18世纪德国文学家拉斯伯（Rudolf Erich Raspe）的小说《巴龙历险记（或译为终极天将）》（Adventures of Baron Munchausen) 记述道：“巴龙掉到湖里沉到湖底，在他绝望的时候，他用自己靴子上的带子把自己拉了上来。”现意指不借助别人的力量，凭自己的努力，终于获得成功。统计学里“bootstrap”法是指用原样本自身的数据抽样得出新的样本及统计量，根据其意现在普遍将其译为“自助法”。

下面引用的是谢益辉博士关于Bootstrap （和 Jackknife）基本思想的论述，让我们对于Bootstrap 建立一个初步的关于统计学的认识：

在统计的世界，我们面临的总是只有样本，Where there is sample, there is uncertainty，正因为不确定性的存在，才使统计能够生生不息。传说统计学家、数学家和物理学家乘坐一列火车上旅行，路上看到草原上有一只黑羊，统计学家说，“基于这个样本来看，这片草原上所有的羊都是黑的”，数学家说，“只有眼前这只羊是黑的”，物理学家则说，“你们都不对，只有羊的这一面是黑的”。这是关于统计和其他学科的一个玩笑话，说明了统计的一些特征，比如基于样本推断总体。

一般情况下，总体永远都无法知道，我们能利用的只有样本，现在的问题是，样本该怎样利用呢？Bootstrap的奥义也就是：既然样本是抽出来的，那我何不从样本中再抽样（Resample）？Jackknife的奥义在于：既然样本是抽出来的，那我在作估计、推断的时候“扔掉”几个样本点看看效果如何？既然人们要质疑估计的稳定性，那么我们就用样本的样本去证明吧。

John Fox的那一系列附录中有一篇叫“Bootstrapping Regression Models”，当我看到第二页用方框框标出那句话时，我才对Bootstrap的思想真正有了了解（之前迷茫了很长时间）。Bootstrap的一般的抽样方式都是“有放回地全抽”（其实样本量也要视情况而定，不一定非要与原样本量相等），意思就是抽取的Bootstrap样本量与原样本相同，只是在抽样方式上采取有放回地抽，这样的抽样可以进行B次，每次都可以求一个相应的统计量/估计量，最后看看这个统计量的稳定性如何（用方差表示）。Jackknife的抽样痕迹不明显，但主旨也是取样本的样本，在作估计推断时，每次先排除一个或者多个样本点，然后用剩下的样本点求一个相应的统计量，最后也可以看统计量的稳定性如何。

在R中简单随机抽样的函数是sample()，其中有个参数replacement表示是否放回，经典的抽样基本都是不放回（replace = FALSE），而Bootstrap则是replace = TRUE；从FALSE到TRUE，小小的一个变化，孕育了Bootstrap的经典思想。

## [](#正文)正文
[Bootstrap](https://github.com/twbs/bootstrap)，作者:[Mark Otto](https://github.com/mdo)和[Jacob Thornton](http://twitter.com/fat)。Twitter推出的CSS框架。

移动优先的自适应解决方案。

[官网](http://getbootstrap.com/)

[中文网站](http://www.bootcss.com/)

[起步文档](http://v3.bootcss.com/getting-started/)

在要使用的html文件头引入（本地或者CDN均可）bootstrap.min.css文件即可开始使用。例：

```
//本地&lt;link rel="stylesheet" href="css/bootstrap.min.css"&gt;//CDN&lt;link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css"&gt;
```

### [](#关于自适应)关于自适应
为了确保适当的绘制和触屏缩放，添加meta标签。

```
&lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;
```

添加 `user-scalable=no` 可以禁止屏幕缩放。这样禁用缩放后，用户的视口只能滚动屏幕，就能让你的网站在移动端看上去更像原生应用。但不推荐所有网站使用，请视自己的需求而定。

```
&lt;meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"&gt;
```

从浏览器内核入手优化兼容：

添加meta标签，如果网页以IE8内核浏览器打开，如果安装了GCF（Google Chrome Frame谷歌内嵌浏览器框架GCF），则使用GCF来渲染页面，如果未安装GCF，则使用最高版本的IE内核进行渲染。

```
&lt;meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"&gt;
```

添加meta标签，双核浏览器时（主要针对国产360浏览器），使浏览器默认使用极速模式（webkit内核）。

```
&lt;meta name="renderer" content="webkit"&gt;
```

bootstrap的栅格系统基于媒体查询，为了使IE8兼容媒体查询和部分html5的标签，在head标签闭合前加入如下代码段（如果浏览器内核为IE9及其以下版本时调用文件）：

```
&lt;!--[if lte IE 9]&gt;  &lt;script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"&gt;&lt;/script&gt;  &lt;script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"&gt;&lt;/script&gt;  &lt;![endif]--&gt;
```

### [](#布局)布局
注意前端代码的模块化组织，降低css选择器的重复性，以大的模块区分功能块。

```
&lt;div class="container-fluid"&gt;&lt;div class="container"&gt;&lt;div class="row"&gt;&lt;div class="col-md-12"&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;
```

.container-fluid（100%宽度）与.container（固定宽度）选其一作为最外侧的盒子，依据为内容是否要占据全部视口。.row作为缓冲带必须嵌套有。lg大屏（&gt;=1200px），md中屏(&gt;=992px)，sm小屏(&gt;=768px)，xs超小屏(&lt;768px)。将外层div均分为12等分，可以任意设置组合，每个col自带15px的padding属性，在每个col中放置内容。栅格系统是自适应布局的核心。根据模块添加类.hidden-md可实现对应尺寸隐藏，达到响应式目的。

### [](#Tips)Tips
如果想要兼容IE8，则尽量**避免使用css3属性**和IE8不兼容的属性（如：background-size，min-height），减少hack工作量。在样式文件中参考bootstrap的屏幕尺寸划分使用媒体查询，或单独针对特定移动端屏幕尺寸适配，也可结合，但须注意css文件渲染顺序为**从上至下，后者覆盖前者**。

```
//大屏@media (max-width:1200px) {  .class{...}}//中屏@media (max-width:992px) {  .class{...}}//小屏@media (max-width:768px) {  .class{...}}//iphone6 Plus@media (max-width:414px) {  .class{...}}//iphone6 @media (max-width:375px) {  .class{...}}//iphone5 @media (max-width:320px) {  .class{...}}
```

### [](#bootstrap常用辅助类归纳)bootstrap常用辅助类归纳

| 类名 
| 作用 

| .text-center(left or right) 
| 文字对齐方式 

| .center-block 
| 设置元素为 display:block 并居中显示 

| .clearfix 
| 清除浮动 

| .pull-left(or right) 
| 元素浮动到左边（右边） 

| .show(.hidden) 
| 强制元素显示（隐藏） 

| .text-hide 
| 将页面元素所包含的文本内容替换为背景图 

| .close 
| 显示关闭按钮 

| .caret 
| 显示下拉式功能 

| .img-responsive 
| 图片自适应 

注：更多请参考文档，或阅读源码，举例，以下为导航条的类：

- .navbar——设置nav元素为导航条组件；

- .navbar-default——指定导航条组件为默认主题；

- .navbar-inverse——指定导航条组件为黑色主题；

- .navbar-fixed-top——设置导航条组件固定在顶部；

- .navbar-fixed-bottom——设置导航条组件固定在底部；

- .navbar-header——主要指定div元素为导航条组件包裹品牌图标及切换按钮；

- .navbar-toggle——设置button元素为导航条组件的切换钮；

- .collapsed——设置button元素为在视口小于768px时才显示；

- .navbar-brand——设置导航条组件内的品牌图标；

- .collapse——设置div元素为视口大于768px时显示；

- .navbar-collapse——设置div元素为导航条组件各列表项的父元素；

- .navbar-nav——设置ul为导航条组件内的列表元素;

- .navbar-left——设置导航条内元素向左对齐；

- .navbar-right——设置导航条内元素向右对齐；

- .navbar-form——为导航条组件内部的表单组件；

- .navbar-btn——为导航条组件内部的按钮样式；

- .navbar-text——为导航条组件内部的文本样式；

- .navbar-link——在标准的导航组件之外添加标准链接，让链接有正确的颜色和反色设置；

- .breadcrumb——设置列表元素显示为路径导航组件；

### [](#关于BS的JavaScript插件)关于BS的JavaScript插件
bootstrap的JS插件基于JQ2.0以上，而JQ2.0以后不再支持IE8，要求兼容性的需要寻找合适的兼容性较好的插件引用。推荐看:[http://www.bootcss.com/中文网下推荐的一些项目。](http://www.bootcss.com/中文网下推荐的一些项目。)

例，推荐轮播插件[bxslider](https://github.com/stevenwanderski/bxslider-4)，结合jquery使用达到响应式目的：

```
&lt;script type="text/javascript" src="js/jquery.bxslider.js"&gt;&lt;/script&gt;&lt;script&gt;	        $(document).ready(function(){	        	var _width=$(window).width();	         if (_width&gt;768) {$('.slider').bxSlider({	            slideWidth: 265,	            minSlides: 4,	            maxSlides: 4,	            slideMargin: 30	          });}	         else{				  $('.slider').bxSlider({	            slideWidth: _width-30,	            minSlides: 1,	            maxSlides: 2,	            controls: false,	            mode: 'fade'	          });		  				  }	        });&lt;/script&gt;
```

      
    

    
      
        

      
    

    
      
        
  
    打赏鼓励一下。
    
      赏
    
    
      
        
          ![Feahter WeChat Pay](/uploads/wx.png)
          微信打赏

        
      
      
        
          ![Feahter Alipay](/uploads/zfb.jpg)
          支付宝打赏

        
      
    
  

      
    

    
      
        
          
            [#Bootstrap](/tags/Bootstrap/)
          
            [#自适应](/tags/自适应/)
          
        
      

      
        
          
            
              
                 设计模式
              
            
          

          
            
              
                thinkphp实践