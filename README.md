- [安装和使用方法](#sec-1)
- [基本语法](#sec-2)

Clojure Wisp 是一个小工具，可以方便编写clojure程序，减少括号的输入。

适用于Clojure和ClojureScript程序。

这个程序改编自guile中的wisp，原网址为： <http://www.draketo.de/english/wisp> ，针对clojure程序进行了加强和改进。

通过这个小工具，可以实现通过空格缩进来展示Clojure程序结构，这和Python程序类似。这样就可以大量减少括号的输入。

例如：

```clojure
defn abc [x]
    println x
```

可转换为：

```clojure
(defn abc [x]
    (println x))
```

# 安装和使用方法<a id="sec-1"></a>

首先安装最新的2.2版本的guile，更多可参考： <https://www.gnu.org/software/guile>

然后：

```sh
git clone https://github.com/cy2081/clj-wisp.git

cd clj-wisp
```

以 `examples` 目录中的 `abc.cljw` 为例，转换为clj程序，可以运行命令：

```sh
guile clj-wisp.scm examples/abc.cljw > abc.clj
```

# 基本语法<a id="sec-2"></a>

这个工具大部分语法和wisp是一样的。

-   通过空格缩进来表示层级结构，代替小括号 `(` 的输入。括号 `[` 和 `{` 保持不变。
-   通过位于行首的符号 =. = 来表示多个参数

针对clojure程序的改进有：

-   行首符号是 `"` `[` `{` `:` `^` `#"` `#{` 保持不变
-   行首符号以 `#:` 开始的关键字，转换后，行首加上 `(`
-   多态函数，行首符号以 `## = 开始，转换后，行首加上 =(`
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
