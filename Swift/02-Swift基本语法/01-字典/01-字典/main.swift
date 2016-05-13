//
//  main.swift
//  01-字典


import Foundation

/**
字典
key: 唯一限制就是可哈希的，这样可以保证它是独一无二的,所有的 Swift 基本类型(例如String，Int，Double和Bool)都是默认可哈希的，并且所有这些类型都可以在字典中当做键使用
Value: 没有要求
*/

// 创建并赋值
let dict0 = ["name": "dahuan", "age": 18, "height": 168.00]
let dict1: [String : Any] = ["name": "dahuan", "age": 18, "height": 168.00]

let dict2: Dictionary = ["name": "dahuan", "age": 18, "height": 168.00]
let dict3: Dictionary<String, Any> = ["name": "dahuan", "age": 18, "height": 168.00]

// 创建空字典
let dict4: [String : Any] = Dictionary()
let dict5: [String : Any] = [:]


// 可变字典
var dict6: [String : Any] = [:]

// 不可变字典
let dict7: [String : Any] = [:]

/*
AnyObject 可以代表任何 class 类型的实例
Any 可以表示任意类型，甚至包括方法 (func) 类型
*/


var dict = ["name": "dahuan", "age": 18, "height": 168.00]
// 字典常见操作
// 1.取值, 取出的值为可选类型
print(dict["name"])

// 2.更新&添加
// 字典中有相同 key, 更新数据
dict["name"] = "xiaohuan"

// updateValue返回一个可选类型, 如果字典中不存在需要更新的key, 那么返回nil, 如果存在返回原始值
if let tmpValue = dict.updateValue("qiuqiu", forKey: "name") {
    print("tmpValue: \(tmpValue)")  // 输出值为：xiaohuan
}

// 没有相同 key, 就添加新数据
dict["number"] = "110"

// updateValue返回一个可选类型, 如果字典中不存在需要更新的key, 那么返回nil, 并且会将新的键值对添加到字典中
if let tmpValue = dict.updateValue(180, forKey: "weigth") {
    print("tmpValue: \(tmpValue)")  // 输出值为：没有输出
}

// 3.删除
// 删除指定的key
dict.removeValueForKey("weigth")

// 删除全部
//dict.removeAll()

// 删除全部，并设置是否删除容量
//dict.removeAll(keepCapacity: true)
print("删除后： \(dict) ")


// 4.遍历字典
for (key, value) in dict {
    print("key: \(key), value: \(value)")
}

for key in dict.keys {
    print(dict[key])
}

for value in dict.values {
    print(value)
}

// 5.合并字典
var dict15: [String: Any] = ["name": "xiaoming", "age": 18]
var newDict = ["height": 180, "number": "10086"]
for (key, value) in newDict {
    dict15.updateValue(value, forKey: key)
}

print("dict15: \(dict15)")


