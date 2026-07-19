---
title: "用vue-cli开发项目的初始配置"
date: 2018-08-23
---

<!-- more -->
# [](#vue-cli项目初始化配置指南)vue-cli项目初始化配置指南

1.安装vue-cli

```
npm install vue-cli -g
```

2.初始化vue项目

```
vue init webpack myproject
```

3.运行项目

```
cd myproject &amp;&amp; npm run dev
```

4.小幅度修改配置

config文件夹内的index.js寻找assetsPublicPath字段，修改’/‘为’./‘。

其作用为`npm run build`之后输出的dist静态文件可以不基于服务器环境直接查看页面效果展示。

5.推荐配套组件

| 组件 
| 作用 

| [element UI](http://element-cn.eleme.io/#/zh-CN/component/installation) 
| UI组件，集成多种PC组件效果 

| [axios](https://www.jianshu.com/p/7a9fbcbb1114) 
| http请求插件，与后台发请求的工具 

| [vue-router](https://router.vuejs.org/zh/guide/) 
| 脚手架默认安装，管理路由的工具 

| [vuex](https://vuex.vuejs.org/zh/guide/) 
| 数据状态管理的工具 

      
    

    
      
        

      
    

    
      
        
  
    打赏鼓励一下。
    
      赏
    
    
      
        
          ![Feahter WeChat Pay](/uploads/wx.png)
          微信打赏

        
      
      
        
          ![Feahter Alipay](/uploads/zfb.jpg)
          支付宝打赏

        
      
    
  

      
    

    
      
        
          
            [#前端](/tags/前端/)
          
            [#vue](/tags/vue/)
          
        
      

      
        
          
            
              
                 Laravel+Vue+element UI+Sass+gulp+webpack相关配置