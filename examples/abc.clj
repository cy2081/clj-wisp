;; 这是一个例子，用两个空格表示缩进

(ns abc
  (:require 
    [reagent.core :as r]
    [reagent.session :as session]))

(def hello "hello world!")

(println hello)

(defn abc [x]
  (println x))

(abc 12345)


