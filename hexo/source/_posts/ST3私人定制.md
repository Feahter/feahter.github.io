---
title: "ST3私人定制"
date: 2016-09-13
categories:
- 器
tags:
- sublime
---

ST3的私人订制。
<!-- more -->
## [](#一、官网下载安装)一、官网下载安装

**1.**[**官网**](http://www.sublimetext.com/3)**下载。**

**2.软件安装。**

## [](#二、正版激活)二、正版激活
**Sublime Text 3 许可证**

*—– BEGIN LICENSE —–*
*Nicolas Hennion*
*Single User License*
*EA7E-866075*
*8A01AA83 1D668D24 4484AEBC 3B04512C*
*827B0DE5 69E9B07A A39ACCC0 F95F5410*
*729D5639 4C37CECB B2522FB3 8D37FDC1*
*72899363 BBA441AC A5F47F08 6CD3B3FE*
*CEFB3783 B2E1BA96 71AAF7B4 AFB61B1D*
*0CC513E7 52FF2333 9F726D2C CDE53B4A*
*810C0D4F E1F419A3 CDA0832B 8440565A*
*35BF00F6 4CA9F869 ED10E245 469C233E*
*—— END LICENSE ——*

**1.打开Sublime菜单 &gt; help &gt; enter License**

**2.复制填入如上许可证或自行搜索一枚，确认激活。**

## [](#三、插件管理器安装)三、插件管理器安装
**1.`ctrl+~` 打开ST自带控制台，复制如下代码至输入框，回车等待。**

```
import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

**2.安装完成后，重启ST，至工具栏 Preferences 见到Package Control 项即安装成功**。(

Package Control 用于ST插件的管理，安装、卸载、更新等工作。

)

## [](#四、插件安装)四、插件安装
**1.插件安装**
`Ctrl+Shift+P`打开插件管理器，输入框输入install，选择安装插件功能，等待弹出安装框，复制或填入要安装的插件名称，回车等待。(每一个插件安装的过程如上，部分安装不了的可能需要科学上网。)
**插件表：**

| 插件 
| 作用 

| ChineseLocalization 
| 汉化 

| HTML5 
| H5标签拓展 

| JsFormat 
| javascript格式化 

| CSS Format 
| CSS 

| Tag 
| HTML 

| Brackethighlighter 
| 标签对标记 

| styleToken 
| 标记颜色代码 

| SideBarEnhancements 
| 增强型侧边栏 

| BufferScroll 
| 代码折叠状态保留 

| Emmet 
| 前端神器 

| FileHeader 
| 文件模板，保存文件修改时间 

| Better Completion 
| 全能代码提示 

| ConvertToUTF8 
| GBK编码兼容 

| PackageResourceViewer 
| 插件 

**2.用户设置**

工具栏 Preferences – Settings-User，打开用户设置文件
选择性填入如下内容：

```
"trim_trailing_white_space_on_save": true,"ensure_newline_at_eof_on_save": true,"translate_tabs_to_spaces": true,"tab_size": 2,"draw_minimap_border": true,"save_on_focus_lost": true,"highlight_line": true,"word_wrap": "true","fade_fold_buttons": false,"bold_folder_labels": true,"highlight_modified_tabs": true,"default_line_ending": "unix", "auto_find_in_selection": true
```

trim_trailing_white_space_on_save,自动移除行尾多余空格。
ensure_newline_at_eof_on_save,文件末尾自动保留一个空行，防止文件在某些开发环境失效。
translate_tabs_to_spaces,代码 tab 对齐转换为空格对齐，
tab_size,配合设置空格数。这个需求因人而异了，不喜欢可以去掉。
draw_minimap_border,用于右侧代码预览时给所在区域加上边框，方便识别。
save_on_focus_lost,窗口失焦立即保存文件，嘛嘛再也不用担心你忘记保存了。
highlight_line,当前行高亮。
word_wrap,设置自动换行。
fade_fold_buttons,默认显示行号右侧的代码段闭合展开三角号。
bold_folder_labels,侧边栏文件夹显示加粗，区别于文件。
highlight_modified_tabs,高亮未保存文件。
default_line_ending: “unix”,使用 unix 风格的换行符。
auto_find_in_selection: true,开启选中范围内搜索(而不是整个文档)

**3.快捷键设置**

工具栏 Preferences – key Bindings-User 打开用户按键绑定

选择性填入如下内容：

```
{ "keys": ["alt+space"], "command": "auto_complete" },{ "keys": ["alt+space"], "command": "replace_completion_with_auto_complete", "context":  [    { "key": "last_command", "operator": "equal", "operand": "insert_best_completion" },    { "key": "auto_complete_visible", "operator": "equal", "operand": false },    { "key": "setting.tab_completion", "operator": "equal", "operand": true }  ]},{ "keys": ["ctrl+alt+d"], "command": "goto_definition" },
```

ST3默认的代码提示快捷键为 `ctrl + space` ，但是这个快捷键在天朝一直都被输入法霸占Mac用户泥奏凯 ，修改快捷键为 `alt+space` 。
ST3自带跳转到函数或CSS定义功能，在DreamWeaver中使用 `ctrl+d` 打开CSS样式定义源面板。

使用`ctrl+alt+d` 定义这个功能，ST3默认的 `ctrl+d` 已有选择相同字符的用途。

| 快捷键 
| 作用 

| **ctrl+shift+p** 
| 所有命令 

| ctrl+g 
| 跳转行 

| ctrl+/ 
| 注释 

| ctrl+d 
| 选择相同字符 

| ctrl+shift+up/down 
| 整行移动 

| ctrl+alt+right 
| 跳到下一个编辑点 

| ctrl+u 
| 图片原始大小更新 

| ctrl+shift+g 
| 批量格式生成 

| ctrl+shift+y 
| 直接公式计算 

| ctrl+up 
| CSS数值加减1（alt+up 数值加减0.1） 

      
    

    
      
        

      
    

    
      
        
  
    打赏鼓励一下。
    
      赏
    
    
      
        
          ![Feahter WeChat Pay](/uploads/wx.png)
          微信打赏

        
      
      
        
          ![Feahter Alipay](/uploads/zfb.jpg)
          支付宝打赏

        
      
    
  

      
    

    
      
        
          
            [#sublime](/tags/sublime/)
          
        
      

      
        
          
            
              
                 jQuery操作dom元素
              
            
          

          
            
              
                探索-妖怪分布统计