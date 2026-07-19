---
title: "thinkphp实践"
date: 2016-11-30
---

ThinkPHP 3.2.3 实践笔记 — 安装配置到项目搭建。
<!-- more -->
ThinkPHP是一个快速、兼容而且简单的轻量级国产PHP开发框架。鉴于5.0之后为迎合php7.0而重新构建的框架的不稳定性，我们使用截至目前较新较稳定的3.2.3版。（实践基础默认web环境已搭建好）

[thinkphp官网](http://www.thinkphp.cn/)

[thinkphp完全开发手册](http://document.thinkphp.cn/manual_3_2.html)

[下载](http://www.thinkphp.cn/down/610.html)

### [](#step-1-解压提取访问)step-1 解压提取访问

解压后将目录中的ThinkPHP文件夹和index.php文件拷入环境根目录任意新建空文件夹中。通过localhost或者127.0.0.1访问本地虚拟服务器环境，访问对应项目。

### [](#step-2-文件目录介绍)step-2 文件目录介绍
打开项目，可见新生成文件夹Application，文件组成及作用如下：

`Application`
`├─Common         应用公共模块`
`│  ├─Common      应用公共函数目录`
`│  └─Conf        应用公共配置文件目录`
`├─Home           默认生成的Home模块`
`│  ├─Conf        模块配置文件目录`
`│  ├─Common      模块函数公共目录`
`│  ├─Controller  模块控制器目录`
`│  ├─Model       模块模型目录`
`│  └─View        模块视图文件目录`
`├─Runtime        运行时目录`
`│  ├─Cache       模版缓存目录`
`│  ├─Data        数据目录`
`│  ├─Logs        日志目录`
`│  └─Temp        缓存目录`

以上文件中的Common-&gt;Conf-&gt;config.php文件,Home-&gt;Controller-&gt;IndexController.class.php文件,View文件夹为主要操作区域。

## [](#从后至前)从后至前
### [](#step-3-配置文件)step-3 配置文件
在config.php文件中配置数据库连接，可在数据库中新建一个测试数据库。连接配置如下：

```
&lt;?phpreturn array(	//'配置项'=&gt;'配置值'//数据库配置信息'DB_TYPE' =&gt; 'mysql', // 数据库类型'DB_HOST' =&gt; 'localhost', // 服务器地址'DB_NAME' =&gt; 'test', // 数据库名'DB_USER' =&gt; 'root', // 用户名'DB_PWD' =&gt; ' ', // 密码'DB_PORT' =&gt; 3306, // 端口'DB_PREFIX' =&gt; 'test_', // 数据库表前缀 'DB_CHARSET'=&gt; 'utf8', // 字符集'DB_DEBUG' =&gt; TRUE, // 数据库调试模式);
```

### [](#step-4-控制文件)step-4 控制文件
在IndexController.class.php中实例化数据库，作为控制文件：

```
&lt;?phpnamespace Home\Controller;use Think\Controller;class IndexController extends Controller {    public function index(){        //实例化数据库表        $test = M('test');        $this-&gt;test=$test-&gt;select();        $this-&gt;display();         }  }
```

### [](#step-5-模板文件)step-5 模板文件
在View文件夹下新建Index文件夹 在Index文件夹中新建index.html，作为模板文件

```
&lt;volist name="test" id="test"&gt;          &lt;h2 class="text-center"&gt;{$test.id}&lt;/h2&gt;           &lt;p class="text-center"&gt;{$test.name}&lt;/p&gt; &lt;/volist&gt;
```

以上为数据库字段内容到前台输出的过程。

访问项目即可看到预先在数据库中输入的字段内容。

注：注意所建数据库表前缀与配置文件保持一致。

## [](#从前到后)从前到后
以一个实际表单提交实例为例：

### [](#step-6-模板文件—表单提交)step-6 模板文件—表单提交

```
//表单&lt;form action="insertbook" method="POST" class="basic-grey" enctype="multipart/form-data" id="form"&gt; &lt;h1&gt;添加图书&lt;/h1&gt;  &lt;label&gt;&lt;span&gt;图书编号：&lt;/span&gt;&lt;input id="b_id" type="text" name="b_id" placeholder="图书编号" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;书名：&lt;/span&gt;&lt;input id="b_name" type="text" name="b_name" placeholder="书名" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;作者：&lt;/span&gt;&lt;input id="author" type="text" name="author" placeholder="作者" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;出版社：&lt;/span&gt;&lt;input id="press" type="text" name="press" placeholder="出版社" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;出版日期：&lt;/span&gt;&lt;input id="p_date" type="date" name="p_date" placeholder="出版日期" style="margin-bottom: 20px;" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;版次：&lt;/span&gt;&lt;input id="edition" type="text" name="edition" placeholder="版次" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;价格：&lt;/span&gt;&lt;input id="price" type="text" name="price" placeholder="价格" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;内容简介 :&lt;/span&gt;&lt;textarea id="intro" name="intro" placeholder="内容简介"&gt;&lt;/textarea&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;图书分类 :&lt;/span&gt;&lt;select name="c_id"&gt;&lt;option&gt;1001 小说&lt;/option&gt;&lt;option&gt;1002 人文社科&lt;/option&gt;&lt;option&gt;1003 科技&lt;/option&gt;&lt;/select&gt;&lt;/label&gt;  &lt;label for="exampleInputFile" style="margin-bottom:20px;"&gt;&lt;span&gt;图书封面 :&lt;/span&gt;请选择要上传的图片&lt;input type="file" name="image" id="image"&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;&lt;input type="button"  class="button" value="添加图书" name="sub" id="sub"/&gt;&lt;/label&gt;&lt;/form&gt;//提交&lt;script&gt;  $("#sub").click(function() {            $("#form").submit();        });  &lt;/script&gt;
```

利用jquery控制点击提交，将用户编写好的表单信息发给insertbook方法。

### [](#step-7-控制文件—添加数据)step-7 控制文件—添加数据

```
public function insertbook(){                         $add=M('book');                         $data=I('post.');                         $upload = new \Think\Upload();                         $upload-&gt;maxSize   =     3145728 ;                         $upload-&gt;exts      =     array('jpg', 'gif', 'png', 'jpeg');                         $upload-&gt;rootPath  =     './Public/';                         $upload-&gt;savePath  =     'images/';                         $upload-&gt;autoSub   =     false;                         $info   =   $upload-&gt;upload();       if(!$info) {        $this-&gt;error($upload-&gt;getError());}  else{       foreach($info as $file){     $data['image']=$file['savename'];    }      // redirect some where    } $result = $add-&gt;add($data); if($result){    //设置成功后跳转页面的地址    $this-&gt;success('新增成功', 'addbook');} else {    //错误页面的默认跳转页面是返回前一页，通常不需要设置    $this-&gt;error('新增失败');}                                                                }
```

insertbook函数利用I方法接收函数后，判断图片文件是否上传成功，成功则将保存的图片文件名称转给实例化的data表的image字段，然后再判断整体存入data表中的操作是否成功。

## [](#删除、更改、查找)删除、更改、查找
### [](#step-8-控制文件—删除)step-8 控制文件—删除
例：以id和书名匹配搜索后，删除对应书籍的信息。

```
public function delebook(){    $del = M("book"); // 实例化User对象    $map['b_id'] = $_POST["b_id"];    $map['b_name'] = $_POST["b_name"];     $map['_logic'] = 'OR';    // 把查询条件传入查询方法   $result = $del-&gt;where($map)-&gt;delete();    if($result){    //设置成功后跳转页面的地址    $this-&gt;success('删除成功', 'delbook');} else {    //错误页面的默认跳转页面是返回前一页，通常不需要设置    $this-&gt;error('删除失败');}  }
```

### [](#step-9-控制文件—更改)step-9 控制文件—更改

```
   public function updatebook()    {$book = M("book"); // 实例化User对象$data =I("post.");$book-&gt;save($data); // 根据条件保存修改的数据 $result = $data;    if($result){    //设置成功后跳转页面的地址    $this-&gt;success('修改成功', 'editbook');} else {    //错误页面的默认跳转页面是返回前一页，通常不需要设置    $this-&gt;error('修改失败');}      }
```

### [](#step-10-模板文件—更改)step-10 模板文件—更改

```
&lt;form action="updatebook" method="post" class="basic-grey" id="form"&gt;&lt;h1&gt;请输入修改内容&lt;/h1&gt;&lt;volist name="data" id="edit"&gt;  &lt;label&gt;&lt;span&gt;书名：&lt;/span&gt;&lt;input id="book" type="text" name="book" placeholder="{$edit.b_name}" value="{$edit.b_name}"/&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;作者：&lt;/span&gt;&lt;input id="author" type="text" name="author" placeholder="{$edit.author}" value="{$edit.author}" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;价格：&lt;/span&gt;&lt;input id="price" type="text" name="price" placeholder="{$edit.price}" value="{$edit.price}" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;图书编号：&lt;/span&gt;&lt;input id="b_id" type="text" name="b_id" placeholder="{$edit.b_id}" value="{$edit.b_id}" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;出版社：&lt;/span&gt;&lt;input id="press" type="text" name="press" placeholder="{$edit.press}" value="{$edit.press}" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;出版日期：&lt;/span&gt;&lt;input id="p_date" type="date" name="p_date" placeholder="{$edit.p_date}" value="{$edit.p_date}" style="margin-bottom: 20px;" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;版次：&lt;/span&gt;&lt;input id="edition" type="text" name="edition" placeholder="{$edit.edition}" value="{$edit.edition}" /&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;内容简介 :&lt;/span&gt;&lt;textarea id="intro" name="intro" placeholder="{$edit.intro}" value="{$edit.intro}"&gt;{$edit.intro}&lt;/textarea&gt;&lt;/label&gt;  &lt;label&gt;&lt;span&gt;图书分类 :&lt;/span&gt;&lt;select name="selection"&gt;&lt;option value="{$edit.c_id}"&gt;{$edit.c_id}&lt;/option&gt;&lt;option&gt;1001 小说&lt;/option&gt;&lt;option&gt;1003 科技&lt;/option&gt;&lt;/select&gt;&lt;/label&gt;  &lt;/volist&gt;  &lt;label&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;&lt;input type="button" class="button" value="确认修改" id="sub" /&gt;&lt;/label&gt;  &lt;/form&gt;
```

通过实例化将现存的数据库字段展示到对应位置，通过重新提交表单的方式再次对数据库字段进行重写，达到修改指定地方的目的。

### [](#step-11-配置文件—搜索)step-11 配置文件—搜索
在全局配置文件中开启URL路由配置，自定义search方法后接k值。

```
	'URL_ROUTER_ON'   =&gt; true,	'URL_ROUTE_RULES'=&gt;array(	'search/:k'               =&gt; 'Index/search',),
```

### [](#step-12-控制文件—搜索)step-12 控制文件—搜索
通过get方法获取k值转化字符串传递给keyword进行like模糊匹配搜索，搜索范围为指定的几个字段。查询后展示。

```
 public function search(){ $keywords = '%'.$_GET['k'].'%';  $where['b_id|b_name|author|c_id'] = array('like',$keywords); $this-&gt;data= $data=M('book')-&gt;where($where)-&gt;select(); $info=$data; if($info){ $this-&gt;display();}else{     $this-&gt;error('抱歉，没有找到相关书籍。'); }}
```

```
&lt;form class="list-1 form-group  "&gt;&lt;input type="text" id="keywords"&gt;&lt;button type="button" class="btn btn-primary btn-xs" id="thesearch"&gt;搜索&lt;/button&gt;&lt;/form&gt;  &lt;script&gt;        $("#thesearch").click(function() {            location.href = '__URL__/search/k/' + $("#keywords").val();        });    &lt;/script&gt;
```

搜索框模板代码如上。

参考[官网入门手册](http://www.kancloud.cn/thinkphp/thinkphp_quickstart/2138)和[实验楼thinkphp框架实践](https://www.shiyanlou.com/courses/96)完成。

更多内容请自行探索。

      
    

    
      
        

      
    

    
      
        
  
    打赏鼓励一下。
    
      赏
    
    
      
        
          ![Feahter WeChat Pay](/uploads/wx.png)
          微信打赏

        
      
      
        
          ![Feahter Alipay](/uploads/zfb.jpg)
          支付宝打赏

        
      
    
  

      
    

    
      
        
          
            [#thinkphp](/tags/thinkphp/)
          
            [#php](/tags/php/)
          
        
      

      
        
          
            
              
                 基于Bootstrap的自适应实施方案
              
            
          

          
            
              
                前端大神