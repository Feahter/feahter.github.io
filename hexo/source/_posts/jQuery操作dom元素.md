---
title: "jQuery操作dom元素"
date: 2016-09-13
---

<!-- more -->
[http://www.w3school.com.cn/jquery/jquery_ref_manipulation.asp](http://www.w3school.com.cn/jquery/jquery_ref_manipulation.asp)
| [addClass()](http://www.w3school.com.cn/jquery/attributes_addclass.asp) | 向匹配的元素添加指定的类名。              |
| —————————————- | ————————— |
| [after()](http://www.w3school.com.cn/jquery/manipulation_after.asp) | 在匹配的元素之后插入内容。               |
| [append()](http://www.w3school.com.cn/jquery/manipulation_append.asp) | 向匹配的元素内部追加内容。               |
| [appendTo()](http://www.w3school.com.cn/jquery/manipulation_appendto.asp) | 向匹配的元素内部追加内容。               |
| [attr()](http://www.w3school.com.cn/jquery/attributes_attr.asp) | 设置或返回匹配元素的属性和值。             |
| [before()](http://www.w3school.com.cn/jquery/manipulation_before.asp) | 在每个匹配的元素之前插入内容。             |
| [clone()](http://www.w3school.com.cn/jquery/manipulation_clone.asp) | 创建匹配元素集合的副本。                |
| [detach()](http://www.w3school.com.cn/jquery/manipulation_detach.asp) | 从 DOM 中移除匹配元素集合。            |
| [empty()](http://www.w3school.com.cn/jquery/manipulation_empty.asp) | 删除匹配的元素集合中所有的子节点。           |
| [hasClass()](http://www.w3school.com.cn/jquery/attributes_hasclass.asp) | 检查匹配的元素是否拥有指定的类。            |
| [html()](http://www.w3school.com.cn/jquery/manipulation_html.asp) | 设置或返回匹配的元素集合中的 HTML 内容。     |
| [insertAfter()](http://www.w3school.com.cn/jquery/manipulation_insertafter.asp) | 把匹配的元素插入到另一个指定的元素集合的后面。     |
| [insertBefore()](http://www.w3school.com.cn/jquery/manipulation_insertbefore.asp) | 把匹配的元素插入到另一个指定的元素集合的前面。     |
| [prepend()](http://www.w3school.com.cn/jquery/manipulation_prepend.asp) | 向每个匹配的元素内部前置内容。             |
| [prependTo()](http://www.w3school.com.cn/jquery/manipulation_perpendto.asp) | 向每个匹配的元素内部前置内容。             |
| [remove()](http://www.w3school.com.cn/jquery/manipulation_remove.asp) | 移除所有匹配的元素。                  |
| [removeAttr()](http://www.w3school.com.cn/jquery/attributes_removeattr.asp) | 从所有匹配的元素中移除指定的属性。           |
| [removeClass()](http://www.w3school.com.cn/jquery/attributes_removeclass.asp) | 从所有匹配的元素中删除全部或者指定的类。        |
| [replaceAll()](http://www.w3school.com.cn/jquery/manipulation_replaceall.asp) | 用匹配的元素替换所有匹配到的元素。           |
| [replaceWith()](http://www.w3school.com.cn/jquery/manipulation_replacewith.asp) | 用新内容替换匹配的元素。                |
| [text()](http://www.w3school.com.cn/jquery/manipulation_text.asp) | 设置或返回匹配元素的内容。               |
| [toggleClass()](http://www.w3school.com.cn/jquery/attributes_toggleclass.asp) | 从匹配的元素中添加或删除一个类。            |
| [unwrap()](http://www.w3school.com.cn/jquery/manipulation_unwrap.asp) | 移除并替换指定元素的父元素。              |
| [val()](http://www.w3school.com.cn/jquery/attributes_val.asp) | 设置或返回匹配元素的值。                |
| [wrap()](http://www.w3school.com.cn/jquery/manipulation_wrap.asp) | 把匹配的元素用指定的内容或元素包裹起来。        |
| [wrapAll()](http://www.w3school.com.cn/jquery/manipulation_wrapall.asp) | 把所有匹配的元素用指定的内容或元素包裹起来。      |
| [wrapinner()](http://www.w3school.com.cn/jquery/manipulation_wrapinner.asp) | 将每一个匹配的元素的子内容用指定的内容或元素包裹起来。 |

获取dom获取表单

document.getElementsByTagName（”from”）;

使用dom获取 某元素src属性的方法

element.getAttribute(“src”); 

利用jquery操作dom

- 利用jquery进行文档处理

2.1：外部插入

**after(content)**

在每个匹配的元素之后插入内容。

返回值

jQuery

参数

content (String, dom, jQuery) : 插入到每个目标后的内容

示例

在所有段落之后插入一些HTML标记代码。

HTML 代码:

I would like to say: 

jQuery 代码:

$(“p”).after(“Hello“);

结果:

I would like to say: 

Hello

在所有段落之后插入一个DOM元素。

HTML 代码:

HelloI would like to say: 

jQuery 代码:

**$(“p”).after( $(“#foo”)[0] );//****将jquery**对象转换为dom**对象$(“#foo”)[0]**

结果:

I would like to say: 

Hello

在所有段落中后插入一个jQuery对象(类似于一个DOM元素数组)。

HTML 代码:

HelloI would like to say: 

jQuery 代码:

**$(“p”).after( $(“b”) );**

结果:

I would like to say: 

Hello

before(content)在每个匹配的元素之前插入内容。

返回值

jQuery

参数

content (String, Element, jQuery) : 插入到每个目标前的内容

示例

在所有段落之前插入一些HTML标记代码。

HTML 代码:

I would like to say: 

jQuery 代码:

$(“p”).before(“Hello“);

结果:   [ Hello

I would like to say: 

 ]

在所有段落之前插入一个元素。

HTML 代码:

I would like to say: 

Hello

jQuery 代码:

$(“p”).before( $(“#foo”)[0] );

结果:

HelloI would like to say: 

在所有段落中前插入一个jQuery对象(类似于一个DOM元素数组)。

HTML 代码:

I would like to say: 

Hello

jQuery 代码:

$(“p”).before( $(“b”) );

结果:

HelloI would like to say: 

**insertAfter(content)**

把所有匹配的元素插入到另一个、指定的元素元素集合的后面。

实际上，使用这个方法是颠倒了常规的$(A).after(B)的操作，即不是把B插入到A后面，而是把A插入到B后面。

返回值jQuery

参数 content (String) : 用于匹配元素的jQuery表达式

示例

在所有段落之后插入一个元素。与 $(“#foo”).after(“p”)相同

HTML 代码:

I would like to say: 

Hello

jQuery 代码:

$(“p”).insertAfter($(“#foo“)); ** ****在$(“#foo“)****在它后面插入段落P**

结果:

HelloI would like to say: 

insertBefore(content)

把所有匹配的元素插入到另一个、指定的元素元素集合的前面。

实际上，使用这个方法是颠倒了常规的$(A).before(B)的操作，即不是把B插入到A前面，而是把A插入到B前面。

返回值jQuery

参数 content (String) : 用于匹配元素的jQuery表达式

示例

在所有段落之前插入一个元素。与 $(“#foo”).before(“p”)相同。

HTML 代码:

HelloI would like to say: 

jQuery 代码:

$(“p”).insertBefore($(“#foo“));   在$(“#foo“)前面插入段落p

结果:

I would like to say: 

Hello

2.2: 内部插入

**append(content)**

向每个匹配的元素内部追加内容。

这个操作与对指定的元素执行appendChild方法，将它们添加到文档中的情况类似。

返回值jQuery

**参数 content (String, Element, jQuery) : ****要追加到目标中的内容**

示例 ：向所有段落中追加一些HTML标记。

HTML 代码:

I would like to say: 

jQuery 代码:

$(“p”).append(“Hello“);   **在p****元素之间插入 b****元素**

结果:

[ 

I would like to say: Hello

 ]

appendTo(content)

把所有匹配的元素追加到另一个、指定的元素元素集合中。

实际上，使用这个方法是颠倒了常规的$(A).append(B)的操作，即不是把B追加到A中，而是把A追加到B中。

返回值jQuery

参数content (String) :用于被追加的内容

示例

把所有段落追加到ID值为foo的元素中。

HTML 代码:

I would like to say: 

jQuery 代码:

$(“p”).appendTo($(“#foo“)); **P****元素被添加到div**元素#foo**之中

结果:

I would like to say: 

prepend(content)**

向每个匹配的元素内部前置内容。

这是向所有匹配元素内部的开始处插入内容的最佳方式。

返回值jQuery

参数content (String, Element, jQuery) : 要插入到目标元素内部前端的内容

示例

向所有段落中前置一些HTML标记代码。

HTML 代码:

I would like to say: 

jQuery 代码:

$(“p”).prepend(“Hello“);   //将Hello添加到p标签内容前

结果:

[ 

HelloI would like to say: 

 ]

将一个DOM元素前置入所有段落

HTML 代码:

I would like to say: 

I would like to say: 

Hello
Good Bye

jQuery 代码:

$(“p”).prepend( $(“.foo”)[0] );

结果:

HelloI would like to say: 

HelloI would like to say: 

Hello
Good Bye

向所有段落中前置一个jQuery对象(类似于一个DOM元素数组)。

HTML 代码:

I would like to say: 

Hello

jQuery 代码:

$(“p”).prepend( $(“b”) );

结果:

HelloI would like to say: 

**prependTo(content)**

把所有匹配的元素前置到另一个、指定的元素元素集合中。

实际上，使用这个方法是颠倒了常规的$(A).prepend(B)的操作，即不是把B前置到A中，而是把A前置到B中。

返回值jQuery

参数content (String) :用于匹配元素的jQuery表达式

示例

把所有段落追加到ID值为foo的元素中。

HTML 代码:

I would like to say: 

jQuery 代码:

$(“p”).prependTo($(“#foo“));  **把所有段落插入到div foo****中

结果:

I would like to say: 

 2.3:

包裹******

}       **wrap(html)**

把所有匹配的元素用其他元素的结构化标记包裹起来。

这种包装对于在文档中插入额外的结构化标记最有用，而且它不会破坏原始文档的语义品质。 这个函数的原理是检查提供的第一个元素（它是由所提供的HTML标记代码动态生成的），并在它的代码结构中找到最上层的祖先元素－－这个祖先元素就是包裹元素。

当HTML标记代码中的元素包含文本时无法使用这个函数。因此，如果要添加文本应该在包裹完成之后再行添加。

返回值jQuery

参数

html (String) : HTML标记代码字符串，用于动态生成元素并包裹目标元素

示例

把所有的段落用一个新创建的div包裹起来

HTML 代码:

Test Paragraph.

jQuery 代码:

$(“p”).wrap(““); 段落P用div class=’wrap’包裹起来

结果:

**Test Paragraph.**

wrap(elem)

把所有匹配的元素用其他元素的结构化标记包装起来。

返回值jQuery

参数elem (Element) : 用于包装目标元素的DOM元素

}         示例

}         用ID是”content”的div将每一个段落包裹起来

}         HTML 代码:

}         

Test Paragraph.

}         jQuery 代码:

}         $(“p”).wrap(document.getElementById(‘content’));

}         结果:

}         Test Paragraph.

**wrapAll(html)**

将所有匹配的元素用单个元素包裹起来

这于 ‘.wrap()’ 是不同的，’.wrap()’为每一个匹配的元素都包裹一次。 这种包装对于在文档中插入额外的结构化标记最有用，而且它不会破坏原始文档的语义品质。

这个函数的原理是检查提供的第一个元素并在它的代码结构中找到最上层的祖先元素－－这个祖先元素就是包装元素。

返回值jQuery

参数html (String) : TML标记代码字符串，用于动态生成元素并包装目标元素

示例

用一个生成的div将所有段落包裹起来

}         HTML 代码:

}         

Hello

cruel

World

}         jQuery 代码:

}         $(“p”).wrapAll(““);  //如果是wrap 则 每个段落P都被div包裹

}         结果:

}         Hello

cruel

World

**wrapAll(elem)**

将所有匹配的元素用单个元素包裹起来

这于 ‘.wrap()’ 是不同的，’.wrap()’为每一个匹配的元素都包裹一次。

返回值jQuery

参数elem (Element) : 用于包装目标元素的DOM元素

示例

用一个生成的div将所有段落包裹起来

HTML 代码:

Hello

cruel

World

jQuery 代码:

$(“p”).wrapAll(document.createElement(“div”));

结果:

Hello

cruel

World

**wrapInner(html)**

将每一个匹配的元素的子内容(包括文本节点)用一个HTML结构包裹起来

这个函数的原理是检查提供的第一个元素（它是由所提供的HTML标记代码动态生成的），并在它的代码结构中找到最上层的祖先元素－－这个祖先元素就是包装元素。

返回值jQuery

参数html (String) : HTML标记代码字符串，用于动态生成元素并包装目标元素

示例

把所有段落内的每个子内容加粗

HTML 代码:

Hello

cruel

World

jQuery 代码:

$(“p”).wrapInner(““);

结果:

Hello

cruel

World

**wrapInner(elem)**

将每一个匹配的元素的子内容(包括文本节点)用DOM元素包裹起来

返回值jQuery

参数elem (Element) : 用于包装目标元素的DOM元素

示例

把所有段落内的每个子内容加粗

HTML 代码:

Hello

cruel

World

jQuery 代码:

$(“p”).wrapInner(document.createElement(“b”));

结果:

Hello

cruel

World

**2.4: ****替换******

**replaceWith(content)**

将所有匹配的元素替换成指定的HTML或DOM元素。

返回值

jQuery

参数

content (String, Element, jQuery) : 用于将匹配元素替换掉的内容

示例

把所有的段落标记替换成加粗的标记。

HTML 代码:

Hello

cruel

World

jQuery 代码:

$(“p”).replaceWith(“Paragraph. “);

结果:

Paragraph. Paragraph. Paragraph. 

**replaceAll(selector) ****去替换******

用匹配的元素替换掉所有 selector匹配到的元素。

返回值jQuery

参数selector (选择器) : 用于查找**所要被替换的元素**

示例

把所有的段落标记替换成加粗标记

HTML 代码:

Hello

cruel

World

jQuery 代码:

$(“Paragraph. “).replaceAll(“p”);  

结果:

Paragraph. Paragraph. Paragraph. 

**2.5: ****删除******

}       **empty()**

删除匹配的元素集合中所有的子节点。

返回值jQuery

示例把所有段落的子元素（包括文本节点）删除

HTML 代码:

Hello, Person [and person](#)

jQuery 代码:

$(“p”).empty();  **删除p****中所有内容**

结果:

**remove([expr])**

从DOM中删除所有匹配的元素。

这个方法不会把匹配的元素从jQuery对象中删除，因而可以在将来再使用这些匹配的元素。

返回值jQuery

参数expr (String) : (可选) 用于筛选元素的jQuery表达式

示例从DOM中把所有段落删除

HTML 代码:

Hello

 how are you?

jQuery 代码:

$(“p”).remove(); **//****移除p****标签**

结果:

how are

从DOM中把带有hello类的段落删除

}         HTML 代码:

}         

Hello

 how are you?

}         jQuery 代码:

}         $(“p”).remove(“.hello”);

}         结果:

}         how are 

you?

**2.6: ****复制******

**clone()**

克隆匹配的DOM元素并且选中这些克隆的副本。

在想把DOM文档中元素的副本添加到其他位置时这个函数非常有用。

返回值jQuery

示例克隆所有b元素（并选中这些克隆的副本），然后将它们前置到所有段落中。

HTML 代码:

Hello

, how are you?

jQuery 代码:

$(“b”).clone().prependTo(“p”);  **将b****标签赋值到p**标签中,**没有clone ****就会直接插入到p**

结果:

Hello

Hello, how are you?

**clone(true)**

元素以及其所有的事件处理并且选中这些克隆的副本

在想把DOM文档中元素的副本添加到其他位置时这个函数非常有用。

返回值jQuery

**参数true (Boolean) : ****设置为true****以便复制元素的所有事件处理**

示例

创建一个按钮，他可以复制自己，并且他的副本也有同样功能。

HTML 代码:

Clone Me!

jQuery 代码:

$(“button”).click(function(){
  $(this).clone(true).insertAfter(this);

**//****复制 **当前元素包含他的事件 **并将副本插入到当前元素前面**});

二、jQuery遍历与查找节点

Ø       过滤

Ø       查找

Ø       串联

1.1、jQuery过滤

**eq(index)****获取第N****个元素**

这个元素的位置是从0算起。

返回值jQuery

参数index (Integer) :元素在jQuery对象中的索引

示例

获取匹配的第二个元素

HTML 代码:

 This is just a test.

  So is this

jQuery 代码:

$(“p”).eq(1)

结果:

[ 

 So is this

 ]

**hasClass(class) ****查找类**

检查当前的元素是否含有某个特定的类，如果有，则返回true。

这其实就是 is(“.” + class)。

返回值Boolean

参数class (String) : 用于匹配的类名

示例：给包含有某个类的元素进行一个动画。

HTML 代码:

jQuery 代码:

$(“div”).click(function(){
  if ( $(this).hasClass(“protected”) )
    $(this)
      .animate({ left: -10 })
      .animate({ left: 10 })
      .animate({ left: -10 })
      .animate({ left: 10 })
      .animate({ left: 0 });
});

**is(expr)**

用一个表达式来检查当前选择的元素集合，如果其中至少有一个元素符合这个给定的表达式就返回true。

如果没有元素符合，或者表达式无效，都返回’false’. ‘filter’ 内部实际也是在调用这个函数，所以，filter()函数原有的规则在这里也适用。

返回值Boolean

参数expr (String) :用于筛选的表达式

示例：由于input元素的父元素是一个表单元素，所以返回true。

HTML 代码:

 

jQuery 代码:

$(“input[type=’checkbox’]”).parent().is(“form”) // parent()父元素

结果:

true

1.2、jQuery查找

**find(expr)**

搜索所有与指定表达式匹配的元素。这个函数是找出正在处理的元素的后代元素的好方法。

所有搜索都依靠jQuery表达式来完成。这个表达式可以使用CSS1-3的选择器语法来写。

返回值jQuery

参数：expr (String) :用于查找的表达式

示例：从所有的段落开始，进一步搜索下面的span元素。与$(“p span”)相同。

}         HTML 代码:

}         

Hello, how are you?

}         jQuery 代码:

}         $(“p”).find(“span”)

}         结果:

}         [ Hello ]

**next([expr])**

取得一个包含匹配的元素集合中每一个元素**紧邻的后面同辈**元素的元素集合。

这个函数只返回后面那个紧邻的同辈元素，而不是后面**所有的同辈元素（可以使用****nextAll****）。**可以用一个可选的表达式进行筛选。

返回值jQuery

参数expr (String) : (可选) 用于筛选的表达式

}         示例找到每个段落的后面紧邻的同辈元素。

}         HTML 代码:

}         

Hello

Hello Again

And Again

}         jQuery 代码:

}         $(“p”).next()

}         结果:

}         [ 

Hello Again

, And Again ]

**找到每个段落的后面紧邻的同辈元素中类名为selected****的元素。**

}         HTML 代码:

}         

Hello

Hello Again

And Again

}         jQuery 代码:

}         $(“p”).next(“.selected”)

}         结果:

}         [ 

Hello Again

 ]

**1.3****、**jQuery**串联******

}       **andSelf()**

**加入先前所选的加入当前元素中**

**对于筛选或查找后的元素，要加入先前所选元素时将会很有用。**

返回值jQuery

示例:选取所有div以及内部的p，并加上border类

HTML 代码:

First Paragraph

Second Paragraph

jQuery 代码:

$(“div”).find(“p”).andSelf().addClass(“border”);

//div中寻找段落P，和他自己（andSelf）加类class=”border”

结果:

First Paragraph

Second Paragraph

      
    

    
      
        

      
    

    
      
        
  
    打赏鼓励一下。
    
      赏
    
    
      
        
          ![Feahter WeChat Pay](/uploads/wx.png)
          微信打赏

        
      
      
        
          ![Feahter Alipay](/uploads/zfb.jpg)
          支付宝打赏

        
      
    
  

      
    

    
      
        
          
            [#jQuery](/tags/jQuery/)
          
        
      

      
        
          
            
              
                 jQuery 的选择器
              
            
          

          
            
              
                ST3私人定制