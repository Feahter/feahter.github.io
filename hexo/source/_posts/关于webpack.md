---
title: "关于webpack"
date: 2017-02-18
---

一、webpack入门准备：
<!-- more -->

本地装好[node](https://nodejs.org/en/)、[npm](https://www.npmjs.com/)

**node** v4.4.7

**npm** v4.0.5

二、安装webpack：

```
npm install -g webpack
```

**webpack** v2.4.1

三、构建项目：

1.创建项目文件webpack

2.命令行移动至webpack文件夹下

3.新建包管理文件package.json或命令行npm init默认创建

4.npm声明依赖覆盖package.json:

```
{  "devDependencies": {    "babel-core": "^6.24.1",    "babel-loader": "^7.0.0",    "babel-preset-es2015": "^6.24.1",    "css-loader": "^0.28.1",    "extract-text-webpack-plugin": "^2.1.0",    "file-loader": "^0.11.1",    "html-webpack-plugin": "^2.28.0",    "jquery": "^3.2.1",    "lodash": "^4.17.4",    "moment": "^2.18.1",    "node-sass": "^4.5.2",    "sass-loader": "^6.0.3",    "scripts": "^0.1.0",    "style-loader": "^0.17.0",    "url-loader": "^0.5.8",    "webpack": "^2.4.1",    "webpack-dev-server": "^2.4.5"  },  "dependencies": {    "lodash": "^4.17.4",    "moment": "^2.18.1"  },  "scripts": {    "start": "webpack-dev-server --inline",     "build": "webpack --progress --profile --colors --config webpack.production.config.js"  }}
```

直接

```
npm install
```

安装依赖

5.新建webpack.config.js文件，这是webpack核心

```
//声明对象var webpack=require('webpack');var path = require('path');var HtmlwebpackPligin=require('html-webpack-plugin');var ROOT_PATH=path.resolve(__dirname);var APP_PATH=path.resolve(ROOT_PATH,'app/js');var CSS_PATH=path.resolve(ROOT_PATH,'app/css');var BUILD_PATH=path.resolve(ROOT_PATH,'build');module.exports = {  //入口  entry:{     app:APP_PATH,  },  //出口  output: {    path: BUILD_PATH,    filename: 'bundle.js',  },  //node虚拟服务    devServer: {    historyApiFallback: true,    inline: true,  },  //loaders模块  module:{    loaders:[     {        test: /\.scss$/,       loaders:['style-loader','css-loader?sourceMap','sass-loader?sourceMap'],       include: CSS_PATH,      },      {        test: /\.(png|jpg|jpeg)$/,        loader: 'url-loader?limit=3000000'      },      {        test: /\.js$/,        loader: 'babel-loader',        include: APP_PATH,        query: {          presets: ['es2015']        }      },    ]  },  //资源地图   devtool: 'eval-source-map',  //插件  plugins: [    new HtmlwebpackPligin({      title:'Hello World app'    }),      new webpack.ProvidePlugin({      $: "jquery",      jQuery: "jquery",      "window.jQuery": "jquery"    })  ],};
```

6.开发生产环境分离

分别在根目录新建app和build文件夹做开发和生产环境。

在app内新建前端常规文件夹层级css、js、images等。

运行 `webpack -p`命令生成压缩文件bundle.js。

在build内新建index.html引入bundle.js。

```
&lt;!DOCTYPE html&gt;&lt;html&gt;  &lt;head&gt;    &lt;meta charset="UTF-8"&gt;    &lt;title&gt;Hello World app&lt;/title&gt;  &lt;/head&gt;  &lt;body&gt;  &lt;script type="text/javascript" src="bundle.js"&gt;&lt;/script&gt;&lt;/body&gt;&lt;/html&gt;
```

本地即可直接打开index.html查看效果。

复制webpack.config.js文件并改名为webpack.production.config.js.

删掉devServer相关代码，资源打包分离压缩处理资源

```
//声明对象var webpack=require('webpack');var path = require('path');var HtmlwebpackPligin=require('html-webpack-plugin');var ROOT_PATH=path.resolve(__dirname);var APP_PATH=path.resolve(ROOT_PATH,'app/js');var CSS_PATH=path.resolve(ROOT_PATH,'app/css');var BUILD_PATH=path.resolve(ROOT_PATH,'build');module.exports = {  //入口  entry:{    app: path.resolve(APP_PATH, 'index.js'),    //添加要打包在vendors里面的库    vendors: ['jquery', 'moment']  },  //输出  output: {    path: BUILD_PATH,    filename: 'bundle.js',  },  //loaders模块打包、转译处理  module:{    loaders:[     {        test: /\.scss$/,       loaders:['style-loader','css-loader?sourceMap','sass-loader?sourceMap'],       include: CSS_PATH,      },      {        test: /\.(png|jpg|jpeg)$/,        loader: 'url-loader?limit=3000000'      },      {        test: /\.js$/,        loader: 'babel-loader',        include: APP_PATH,        query: {          presets: ['es2015']        }      },    ]  },  //生成资源地图.map   devtool: 'eval-source-map',  //插件  plugins: [      //这个使用uglifyJs压缩你的js代码    new webpack.optimize.UglifyJsPlugin({minimize: true}),    //把入口文件里面的数组打包成verdors.js    new webpack.optimize.CommonsChunkPlugin('vendors', 'vendors.js'),    new HtmlwebpackPligin({      title:'Hello World app'    }),      new webpack.ProvidePlugin({      $: "jquery",      jQuery: "jquery",      "window.jQuery": "jquery"    })  ],};
```

      
    

    
      
        

      
    

    
      
        
  
    打赏鼓励一下。
    
      赏
    
    
      
        
          ![Feahter WeChat Pay](/uploads/wx.png)
          微信打赏

        
      
      
        
          ![Feahter Alipay](/uploads/zfb.jpg)
          支付宝打赏

        
      
    
  

      
    

    
      
        
          
            [#webpack](/tags/webpack/)
          
            [#前端模块化](/tags/前端模块化/)
          
        
      

      
        
          
            
              
                 关于TypeScript
              
            
          

          
            
              
                前端项目列表