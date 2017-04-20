;; 这是一个例子，用两个空格表示缩进


(ns abc.routes.services
  (:require [ring.util.http-response :refer :all]
            [compojure.api.sweet :refer :all]
            [schema.core :as s]))

(def hello "hello world")

;; 定义函数
(defn abc
  "这里是程序说明"
  [x]   ;参数
  (println x))


;; 定义多态函数
(defn abc2
  "这里是程序说明"
  ([x]
    (println x))

  ([x y]
    (println x y)))

;; 基本演示
(def abc3 []
  (println 1 2 3
    4 5 6)
  (println "hello world")
  (println
    (str "hello world"))

  (println (str "hello world"))

  (let [x "hello"
       y "world"]
    (println x y)))


(defn format-time [timestamp]
  (-> "yyyy-MM-dd HH:mm:ss"
      (java.text.SimpleDateFormat.)
      (.format timestamp)))

(def my-list
  '(1 2 3 ))

(def my-list2
  `(1 2 3))

(def my-deref
  @(a b c))

(def a-set
  #(1 2 3))

(def comment
  #_(a b c))

(def aaaa
  #?(a b c)
  #?@(a b c))

(def dict
  {:x 1
   :y 2})

(defn show-dict []
  (println
    (:x dict)))

(defapi service-routes
  {:swagger {:ui "/swagger-ui"
             :spec "/swagger.json"
             :data {:info {:version "1.0.0"
                           :title "Sample API"
                           :description "Sample Services"}}}}

  (context "/api" []
    :tags ["thingie"]

    (GET "/datomic/relay/list" []
         :return      [Relay]
         :summary     "list relay"
         (ok (datomic/relay-list)))))

