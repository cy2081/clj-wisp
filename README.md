- [安装和使用方法](#sec-1)
- [基本语法](#sec-2)
- [Emacs 用户](#sec-3)
- [更多技巧](#sec-4)

Clojure Wisp 是一个小工具，可以方便编写clojure程序，减少括号的输入。

适用于Clojure和ClojureScript程序。

当前版本： 0.9，目前只在Linux系统中测试通过。

这个程序改编自 Guile 中的 Wisp，原网址为： <http://www.draketo.de/english/wisp> ，针对clojure程序进行了加强和改进。

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

首先安装最新的2.2版本的Guile，更多可参考： <https://www.gnu.org/software/guile>

然后：

```sh
git clone https://github.com/cy2081/clj-wisp.git

cd clj-wisp
```

以 `examples` 目录中的 `abc.cljw` 为例，转换为clj程序，可以运行命令：

```sh
guile clj-wisp.scm examples/abc.cljw > abc.clj
```

注意其中使用了 `>`

为了方便调用，根据需要可修改shell程序 `cwisp.sh` ，例如运行 ：

```sh
./cwisp.sh examples/abc.cljw abc.clj
```

# 基本语法<a id="sec-2"></a>

这个工具大部分语法和wisp是一样的，可参考wisp文档。

-   通过空格缩进来表示层级结构，代替小括号 `(` 的输入。括号 `[` 和 `{` 保持不变。
-   通过位于行首的符号 `.` 开始，后带空格，来表示多个连续参数
-   行中间，用前后带有空格的 `:` 表示新的 `(`

针对clojure程序的改进有：

-   行首符号是 `"` `[` `{` `:` `^` `#"` `#{` 保持不变，等同于表示连续参数的 `.` 符号
-   行首符号以 `#:` 开始的关键字，转换后，行首加上 `(`
-   多态函数，行首符号以 `##＝ 开始，后带空格，转换后，行首加上 =(`
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

更多例子可参考 `examples/more.cljw` 。

# Emacs 用户<a id="sec-3"></a>

可安装 wisp-mode 辅助编辑。建议使用Emacs，其中可以很方便的添加各种命令，方便编辑。

# 更多技巧<a id="sec-4"></a>

待续
