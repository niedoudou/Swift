//
//  main.swift
//  05-元祖


import Foundation

/*
元祖
将多个相同或者不同类型的值用一个小括号括起来就是一个元祖，元祖和结构体很像，其实元祖就是复合类型, 小括号中可以写任意类型如果不定义类型，可根据数据自动推断出类型(建议加上)
*/

// 省略了类型
let person = ("大欢", 17, 168.00)
// 没有省略类型
let person1: (String, Int, Double, String) = ("大欢", 17, 168.00, "")

// 取值
print(person1)
// 获取元祖中每一个值
print(person1.0)  // 输出值为：大欢
print(person1.2)  // 输出值为：168.00

/*
从上面元祖的定义中，我们发现这样定义会有些缺陷，会造成代码的可读性非常的差
同时通过索引取值也不够直观，那么元祖还有别的定义方式吗？

元祖的其它定义方式:
指明应用元祖元素的名称
例如：
定义 -> 类型(name: String, age: Int, height: Float)可以添加
*/
// 省略了类型
let person2 = (name: "大欢", age: 18, height: 168.00)
// 没有省略了类型
let person3: (name: String, age: Int, height: Double) = (name: "大欢", age: 18, height: 168.00)

// 获取对应的值
print("name: \(person3.name), age: \(person3.age)")

/*
元祖的其它定义方式:
通过指定的名称提取元祖对应的值, 会将对应位置的值赋值给对应位置的名称
*/
let (name, age, height) = (name: "大欢", age: 18, height: 168.00)
print("--------")
print(name)
print(age)


