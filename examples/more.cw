;; clj-wisp 演示
;; 这是一个例子，用两个空格表示缩进


ns abc.routes.services
  #:require
    [ring.util.http-response :refer :all]
    [compojure.api.sweet :refer :all]
    [schema.core :as s]

def hello "hello world"

;; 定义函数，同时演示行内 : 的使用 
defn abc
  "这里是函数说明"
  [x y]   ;参数注释
  if : < x 5
    println x
    println
      + y 10
  if
    > x 5
    println y
    println
      + y 10

;; 关键字的使用 
defn update-map [a-map]
  assoc a-map
    :name         ;普通的关键字
    "Jack"

defn show-dict []
  println
    #:x dict      ;符号#实现函数式调用 :x

;; 定义多态函数
defn abc2
  "这里是程序说明"
  ## [x]
    println x

  ## [x y]
    println x y

;; 基本演示
defn abc3 []
  println 1 2 3
    . 4 5 6             ; 用 . 符号表示连续的参数，4 5 6 是 println 的参数 

  println 1 2 3
    & 4 5 6             ; 用 & 符号表示连续的参数，4 5 6 是 println 的参数 

  println "hello world"

  println
    str "hello world"

  println : str "hello world"           ; 行中间用 : 表示新（的开始

  println << str "hello world"           ; 行中间用 << 表示新（的开始

  let [x "hello"
       y "world"]
    println x y


defn format-time [timestamp]
  -> "yyyy-MM-dd HH:mm:ss"
      java.text.SimpleDateFormat.
      .format timestamp

;; 演示行内符号:和<<的使用
defn my-round
  [value]
  when : > value 20
    float
      / << Math/round << * 100  << float value
        & 100

def my-list
  ' 1 2 3 

def my-list2
  ` 1 2 3

def my-list3 ‘(1 2 3)             ;圆括号不变

def my-list4 (list (1 2 3))             ;圆括号不变

def my-deref
  @ a b c

def a-set
  # 1 2 3

def comment
  #_ a b c

def aaaa
  #? a b c
  #?@ a b c

def dict
  {:x 1
   :y 2}

def abcd
  #? :clj     Double/NaN
     :cljs    js/NaN
     :default nil


defn java []
  #. java method
  #.. java method2

;; 演示匿名函数
defn amap [my-list]
  map
    # str %
    & my-list

;; 多一点的演示
defapi service-routes
  {:swagger {:ui "/swagger-ui"
             :spec "/swagger.json"
             :data {:info {:version "1.0.0"
                           :title "Sample API"
                           :description "Sample Services"}}}}

  context "/api" []
    :tags ["thingie"]

    GET "/datomic/relay/list" []
         :return      [Relay]
         :summary     "list relay"
         ok (datomic/relay-list)
