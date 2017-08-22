- [简介](#sec-1)
- [安装和使用方法](#sec-2)
- [文件名称](#sec-3)
- [基本语法](#sec-4)
- [Emacs 编辑器支持](#sec-5)
- [联系作者](#sec-6)

# 简介<a id="sec-1"></a>

clj-wisp 是一个用来辅助编写Clojure或ClojureScript程序的工具，可以减少括号的输入次数。

当前版本： 0.9

这个程序改编自 [Guile](https://www.gnu.org/software/guile) 中的 Wisp，原网址为： <http://www.draketo.de/english/wisp> ，针对Clojure语言进行了加强和改进。

通过这个小工具，可以实现通过空格缩进来展示Clojure程序结构。这样就可以大量减少括号的输入。

屏幕截图可参考： <http://dustycloud.org/blog/wisp-lisp-alternative/>

例如，文件 `abc.cw` 内容为：

```clojure
defn abc [x]
    println x
```

通过运行guile，调用 `clj-wisp.scm` ：

```sh
guile clj-wisp.scm abc.cw > abc.clj 
```

可转换为 `abc.clj` ：

```clojure
(defn abc [x]
    (println x))
```

# 安装和使用方法<a id="sec-2"></a>

首先安装最新的2.2版本的Guile，更多可参考： <https://www.gnu.org/software/guile>

然后：

```sh
git clone https://github.com/cy2081/clj-wisp.git

cd clj-wisp
```

以 `examples` 目录中的 `abc.cw` 为例，转换为clj程序，可以运行命令：

```sh
guile clj-wisp.scm examples/abc.cw > abc.clj 
```

注意其中使用了 `>`

为了方便调用，可调用shell程序 `clj-wisp.sh` ，例如运行 ：

```sh
./bin/clj-wisp.sh  examples/abc.cw  abc.clj 
```

# 文件名称<a id="sec-3"></a>

文件扩展名默认规定为：

-   `cw` 用来转换为clj文件，例如： abc.cw 转换为 abc.clj
-   `csw` 用来转换为cljs文件，例如： abc.csw 转换为 abc.cljs
-   `ccw` 用来转换为cljc文件，例如： abc.ccw 转换为 abc.cljc

# 基本语法<a id="sec-4"></a>

这个工具大部分语法和wisp是一样的，可参考wisp文档。

-   通过空格缩进来表示层级结构，代替小括号 `(` 的输入。中括号 `[` 和大括号 `{` 当中的内容保持不变。
-   通过位于行首的符号 `.` 开始，后带空格，表示多个连续参数
-   行中间，用前后带有空格的 `:` 表示新的 `(`

针对clojure程序的改进有：

-   行首符号是 `"` `[` `{` `:` `^` `#"` `#{` 保持不变，等同于表示连续参数的 `.` 符号
-   行首符号以 `#:` 开始的关键字，转换后，行首加上 `(`
-   行首符号以 `#.` 开始，后带空格，转换后为 `(.`
-   行首符号以 `#..` 开始，后带空格，转换后为 `(..`
-   多态函数，行首符号以 `##` 开始，后带空格，转换后，行首加上 `(`
-   以下行首符号带有空格的，转换后，在符号后边加 `(`

```
'  
, 
` 
#` 
#' 
#, 
#,@, 
@ 
# 
#_ 
#? 
#?@ 
```

更多例子可参考 `examples/more.cw` 。

# Emacs 编辑器支持<a id="sec-5"></a>

先安装clojure-mode 和 org-mode。

然后可按照通常的方式调用clj-wisp-mode，请参考 emacs/config-example.el 文件。

小技巧：

1.  打开Emacs的缩进提示功能可以方便编辑。
2.  Org-mode 中的 tangle 功能，可以帮助转换，可参考例子文件：examples/tangle.org。

# 联系作者<a id="sec-6"></a>

，作者：CY，有问题发邮件至：1829233719@qq.com ，欢迎咨询。
