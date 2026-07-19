---
title: "关于remetajs"
date: 2017-08-07
categories:
- 术
tags:
- JavaScript
---

remeta.js 屏幕适配方案 — 跨屏自适应工具。
<!-- more -->
remeta.js主要由两部分构成，hitdpr()和remeta()。

### [](#1-hitdpr)1.hitdpr
给根节点打上dpr标记，区分高倍屏，方便图片资源替换。

### [](#2-remeta)2.remeta
通关设置目标参数集中适配同一版css，可直接使用px，而无需计算em或是rem。

## [](#场景)场景
适用所有情况下的关于屏幕适配的问题，跨屏自适应，兼容ie8+，减轻媒体查询工作。

## [](#代码)代码

```
/* * @Author: feahter * @Date:   2017-08-02 15:38:47 * @Last Modified by:   feahter * @Last Modified time: 2017-08-03 11:57:31 */'use strict';! function(w, d) {    var _width = w.screen.availWidth;    var dpr = 0;    function hitdpr() {        var isAndroid = w.navigator.appVersion.match(/android/gi);        var isIPhone = w.navigator.appVersion.match(/iphone/gi);        var devicePixelRatio = w.devicePixelRatio;        if (isIPhone) {            // iOS下，对于2和3的屏，用2倍的方案，其余的用1倍方案            if (devicePixelRatio &gt;= 3 &amp;&amp; (!dpr || dpr &gt;= 3)) {                dpr = 3;            } else if (devicePixelRatio &gt;= 2 &amp;&amp; (!dpr || dpr &gt;= 2)) {                dpr = 2;            } else {                dpr = 1;            }        } else {            devicePixelRatio ? dpr = devicePixelRatio : dpr = 1;        }        d.documentElement.setAttribute('data-dpr', dpr);    }    function remeta(target) {        var _meta = d.querySelector('meta[name="viewport"]');        var scale = _width / target;        if (scale &gt; 1) { scale = 1; }        var oString = "width=device-width, initial-scale=" + scale + ", maximum-scale=" + scale + ", user-scalable=no";        if (!_meta) {            _meta = d.createElement('meta');            _meta.setAttribute('name', 'viewport');            _meta.setAttribute('content', oString);            if (_meta.firstElementChild) {                _meta.firstElementChild.appendChild(_meta);            } else {                var wrap = d.createElement('div');                wrap.appendChild(_meta);                document.write(wrap.innerHTML);            }        } else {            _meta.setAttribute('content', oString);        }    };    // 页面加载调用    (function() {        if (_width &lt;= 414) {            remeta(414);        } else if (_width &gt; 414 &amp;&amp; _width &lt;= 768) {            remeta(768);        } else if (_width &gt; 768 &amp;&amp; _width &lt;= 1200) {            remeta(1280);        }        hitdpr();    })();    //用户变化屏幕方向时调用    w.addEventListener('orientationchange', function(e) {        if (_width &gt;= 768 &amp;&amp; _width &lt;= 1200) {            location.reload();        }    });}(window, document);
```

### [](#1-hitdpr-1)1.hitdpr()

```
function hitdpr() {       var isAndroid = w.navigator.appVersion.match(/android/gi);       var isIPhone = w.navigator.appVersion.match(/iphone/gi);       var devicePixelRatio = w.devicePixelRatio;       if (isIPhone) {           // iOS下，对于2和3的屏，用2倍的方案，其余的用1倍方案           if (devicePixelRatio &gt;= 3 &amp;&amp; (!dpr || dpr &gt;= 3)) {               dpr = 3;           } else if (devicePixelRatio &gt;= 2 &amp;&amp; (!dpr || dpr &gt;= 2)) {               dpr = 2;           } else {               dpr = 1;           }       } else {           devicePixelRatio ? dpr = devicePixelRatio : dpr = 1;       }       d.documentElement.setAttribute('data-dpr', dpr);   }
```

通过window对象的devicePixelRatio属性获取dpr，正则匹配判断区分设备系统类型，给根节点打上标记。

### [](#2-remta)2.remta()

```
function remeta(target) {        var _meta = d.querySelector('meta[name="viewport"]');        var scale = _width / target;        if (scale &gt; 1) { scale = 1; }        var oString = "width=device-width, initial-scale=" + scale + ", maximum-scale=" + scale + ", user-scalable=no";        if (!_meta) {            _meta = d.createElement('meta');            _meta.setAttribute('name', 'viewport');            _meta.setAttribute('content', oString);            if (_meta.firstElementChild) {                _meta.firstElementChild.appendChild(_meta);            } else {                var wrap = d.createElement('div');                wrap.appendChild(_meta);                document.write(wrap.innerHTML);            }        } else {            _meta.setAttribute('content', oString);        }    };
```

获取当前设备的真实宽度，设置目标target参数，通过创建或改写name为viewport的meta标签参数达到缩放目的。

### [](#3-调用)3.调用

```
// 页面加载调用  (function() {      if (_width &lt;= 414) {          remeta(414);      } else if (_width &gt; 414 &amp;&amp; _width &lt;= 768) {          remeta(768);      } else if (_width &gt; 768 &amp;&amp; _width &lt;= 1200) {          remeta(1280);      }      hitdpr();  })();  //用户变化屏幕方向时调用  w.addEventListener('orientationchange', function(e) {      if (_width &gt;= 768 &amp;&amp; _width &lt;= 1200) {          location.reload();      }  });
```

通过判断参数调用remeta(target)实现集中兼容，小于逻辑宽度为414的均集中缩放至414的显示效果，通过监听orientationchange事件刷新横竖屏变化事件。

      
    

    
      
        

      
    

    
      
        
  
    打赏鼓励一下。
    
      赏
    
    
      
        
          ![Feahter WeChat Pay](/uploads/wx.png)
          微信打赏

        
      
      
        
          ![Feahter Alipay](/uploads/zfb.jpg)
          支付宝打赏

        
      
    
  

      
    

    
      
        
          
            [#JavaScript](/tags/JavaScript/)
          
        
      

      
        
          
            
              
                 研究生算法设计大纲
              
            
          

          
            
              
                Laravel+Vue+element UI+Sass+gulp+webpack相关配置