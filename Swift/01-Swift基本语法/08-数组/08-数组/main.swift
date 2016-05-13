//
//  main.swift
//  08-数组


import Foundation

/**
数组
OC: 只能存放对象
Swift: 可以存放任何类型，包括基本数据类型
*/

// 空数组
let arr1 = []
let arr2 = [Int]()
let arr3 = Array<Int>()

// 有值的数组
let arr4 = [1, 2, 3, 4]
let arr5: [Int] = [1, 2, 3]
let arr6: Array<Int> = [1, 2, 3]

// 可变数组:
var arr7 = []
// 不可变数组:
let arr8 = []

/**
数组中保存的对象类型
如果初始化时，所有内容类型一致，择数组中保存的是该类型的内容
如果初始化时，所有内容类型不一致，择数组中保存的是 NSObject
*/

// 数组中保存的都是字符串, 数组类型为 [String]
let arr9: [String] = ["zhangsan", "lisi", "wangmazi"]

// 数组中保存的类型不一致, 数组类型为 [NSObject]
let arr10 = ["zhangsan", 19, 168.00]


// 数组的常见操作
// 1.获取长度
print(arr10.count)


// 2.判断是否为空
// 注意： 定义一个空数组的时候，最好声明一个数组
// Any: 表示为任何对象
// AnyObject: 表示任何Class
let arr11: [Any] = []
if arr11.isEmpty {
    print("数组为空")
}

// 3.取值
var array = ["zhangsan", 17, "lisi", "wangmazi"]

// 取指定的某一个值, 取值的时候注意越界的情况
print(array[2])

// 指定取某一个区间的值
// 使用区间... 或 ..<
print(array[0..<2])
// 使用Range来取值
print(array[Range(start: 0, end: 2)])
// 总结： Range其实就是一个半封闭的区间


// 4.添加元素
// 方法1
// append后面可以添加任何类型
array.append(168.00)

// 方法2
// 添加的是一个数组
array += ["dahuan"]

// 5.插入元素
array.insert("大欢", atIndex: 3)

// 6.更新元素
array[3] = "小欢"

// 7.删除元素
// 删除第一个元素
array.removeFirst()

// 删除最后一个元素
array.removeLast()
print(array)

var arrM = [1, 2, 3, 4, 5]

// 删除range范围的元素
//arrM.removeRange(Range(start: 1, end: 2))
arrM.removeRange(1...2)
print("arrM: \(arrM)")

// 删除所有元素, 默认也删除容量
//arrM.removeAll()

// 删除所有元素，并设置是否删除容量
arrM.removeAll(keepCapacity: true)

// 查看数组中的容量
// 容量一定是为2的倍数
print("capacity: \(arrM.capacity)")


// 8.数组的批量操作
var arrM1 = [1, 2, 3, 4]
// 把数组中第0个和第1个元素替换为[80, 81, 82, 83]
//arrM1[0...1] = [80, 81, 82, 83]

// 另外的实现形式
//arrM1.replaceRange(Range(start: 0, end: 2), with: [80, 81, 82, 83])
arrM1.replaceRange(0..<2, with: [80, 81, 82, 83])

print(arrM1)

// 9.遍历数组
// for循环，注意id不能用常量来修饰（let）
for var idx = 0; idx < arrM1.count; idx++ {
    print(arrM1[idx])
}

// forin循环
for obj in arrM1 {
    print(obj)
}

// 取出数组中某个区间范围的值
for obj in arrM1[0...3] {
    print(obj)
}







