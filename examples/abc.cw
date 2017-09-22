;; clj-wisp 简单演示
;; 这是一个例子，用两个空格表示缩进
;; 更多请看 more.cw 文件

ns abc
  #:require 
    [reagent.core :as r]
    [reagent.session :as session]

def hello "hello world!"

println hello

defn abc [x]
  println x

abc 12345
