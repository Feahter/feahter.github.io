---
title: "Laravel+Vue+element UI+Sass+gulp+webpack相关配置"
date: 2017-08-07
---

1.首先安装composer，php的包管理器。
地址：[https://getcomposer.org/download/](https://getcomposer.org/download/)
<!-- more -->

2.然后跳转至本地虚拟环境，打开命令行利用composer安装Laravel项目：(laravelapp为项目名称)

```
composer create-project laravel/laravel laravelapp --prefer-dist
```

3.安装完毕后依次运行：

```
composer updatephp artisan key:generatephp artisan serve
```

访问[http://127.0.0.1:8000，有返回提示页，即为成功。](http://127.0.0.1:8000，有返回提示页，即为成功。)

4.修改根目录下的package.json添加依赖项如下：

```
{    "private": true,    "scripts": {        "dev": "npm run development",        "development": "cross-env NODE_ENV=development node_modules/webpack/bin/webpack.js --progress --hide-modules --config=node_modules/laravel-mix/setup/webpack.config.js",        "watch": "cross-env NODE_ENV=development node_modules/webpack/bin/webpack.js --watch --progress --hide-modules --config=node_modules/laravel-mix/setup/webpack.config.js",        "watch-poll": "npm run watch -- --watch-poll",        "hot": "cross-env NODE_ENV=development node_modules/webpack-dev-server/bin/webpack-dev-server.js --inline --hot --config=node_modules/laravel-mix/setup/webpack.config.js",        "prod": "npm run production",        "production": "cross-env NODE_ENV=production node_modules/webpack/bin/webpack.js --progress --hide-modules --config=node_modules/laravel-mix/setup/webpack.config.js"    },    "devDependencies": {        "axios": "^0.16.2",        "babel-core": "^6.20.0",        "babel-loader": "^6.2.9",        "bootstrap-sass": "^3.3.7",        "cross-env": "^5.0.1",        "css-loader": "^0.25.0",        "element-ui": "^1.1.1",        "gulp": "^3.9.1",        "handsontable": "0.27.0",        "jquery": "^3.1.1",        "laravel-elixir": "^6.0.0-15",        "laravel-elixir-vue-2": "^0.2.0",        "laravel-elixir-webpack-official": "^1.0.10",        "laravel-mix": "^1.0",        "lodash": "^4.17.4",        "node-sass": "^4.5.3",        "style-loader": "^0.13.1",        "vue": "^2.1.4",        "vue-loader": "^10.0.0",        "vue-resource": "^1.0.3",        "vue-router": "^2.1.1",        "vue-template-compiler": "^2.1.4",        "element-ui": "^1.4.1"    },    "dependencies": {}}
```

4.安装node，地址：

[https://nodejs.org/en/download/](https://nodejs.org/en/download/)

5.node自带包管理器，在命令行运行依赖插入指令：

```
npm install
```

6.如果依赖安装过慢可挂vpn，或设置国内镜像替代运行如下指令：

```
npm config set registry http://registry.npm.taobao.org
```

7.完成后注意sass的编译依赖python，但版本请不高于2.7，请注意下载安装。

8.根目录新建gulpfile.js文件：编写内容如下：

```
const elixir = require('laravel-elixir');const path = require('path');require('laravel-elixir-vue-2');/*|--------------------------------------------------------------------------| Elixir Asset Management|--------------------------------------------------------------------------|| Elixir provides a clean, fluent API for defining some basic Gulp tasks| for your Laravel application. By default, we are compiling the Sass| file for our application, as well as publishing vendor resources.|*/elixir(mix =&gt; {    // Elixir.webpack.config.module.loaders = [];    Elixir.webpack.mergeConfig({        resolveLoader: {            root: path.join(__dirname, 'node_modules'),        },        module: {            loaders: [{                test: /\.css$/,                loader: 'style!css'            }]        }    });    mix.sass('app.scss')        .webpack('app.js')});
```

9.resources\assets\js目录下新建App.vue文件，内容如下：

```
&lt;template&gt;&lt;div id=&quot;app&quot;&gt;&lt;router-view&gt;&lt;/router-view&gt;&lt;/div&gt;&lt;/template&gt;
```

10.修改app.js内容：

```
/**   * First we will load all of this project's JavaScript dependencies which   * includes Vue and other libraries. It is a great starting point when   * building robust, powerful web applications using Vue and Laravel.   */require('./bootstrap');/**   * Next, we will create a fresh Vue application instance and attach it to   * the page. Then, you may begin adding components to this application   * or customize the JavaScript scaffolding to fit your unique needs.   */import Vue from 'vue'import App from './App.vue'import VueRouter from 'vue-router'import ElementUI from 'element-ui'import 'element-ui/lib/theme-default/index.css'Vue.use(VueRouter)Vue.use(ElementUI)const router = new VueRouter({    routes: [        { path: '/', component: require('./components/Example.vue') }    ]})const app = new Vue({    el: '#app',    router,    template: '&lt;App/&gt;',    components: { App }});
```

11.修改views文件夹下的welcome.blade.php文件：

```
&lt;!DOCTYPE html&gt;&lt;html lang="en"&gt;&lt;head&gt;&lt;meta charset="UTF-8"&gt;&lt;meta name="csrf-token" content="{{ csrf_token() }}"&gt;&lt;title&gt;Hello&lt;/title&gt;&lt;/head&gt;&lt;body&gt;&lt;div id="app"&gt;&lt;/div&gt;&lt;script src="{{ asset('js/app.js') }}"&gt;&lt;/script&gt;&lt;/body&gt;&lt;/html&gt;
```

运行命令 ：

```
gulp watchphp artisan serve
```

基本项目即配置完毕。

      
    

    
      
        

      
    

    
      
        
  
    打赏鼓励一下。
    
      赏
    
    
      
        
          ![Feahter WeChat Pay](/uploads/wx.png)
          微信打赏

        
      
      
        
          ![Feahter Alipay](/uploads/zfb.jpg)
          支付宝打赏

        
      
    
  

      
    

    
      
        
          
            [#项目配置](/tags/项目配置/)
          
            [#Laravel](/tags/Laravel/)
          
            [#Vue](/tags/Vue/)
          
        
      

      
        
          
            
              
                 关于remetajs
              
            
          

          
            
              
                用vue-cli开发项目的初始配置