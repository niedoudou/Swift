//
//  main.swift
//  03-运算符


import Foundation

/*
运算符
算术运算符: 除了取模, 其它和OC一样, 包括优先级
+ - * / % ++ --

注意：Swift是安全严格的编程语言, 会在编译时候检查是否溢出, 但是只会检查字面量而不会检查变量, 所以在Swift中一定要注意隐式溢出
*/
// 可以检测
//var num1: UInt8 = 255 + 1

// 无法检测
//var num1: UInt8 = 255
//var num2: UInt8 = num1 + 1

// 注意：Swift是安全严格的编程语言, 在做运算操作的时候(如：+ - * / 等)，需要计算的两个类型保持一致
let num1 = 10
// 类型不一致，不能做数学运算
//let num2 = num1 + 0.5
let num2: Float = Float(num1) + 0.5
// 对浮点型强制转化为整型，只取整数
let num3: Int = num1 + Int(1.6)
print(num3)


/*
取模 %
OC: 只能对整数取模
Swift: 支持小数取模
*/
let result = 8 % 2.5
print(result)


/*
OC: 表达式的结合方向是从左至右, 整个表达式的值整体的值等于最后一个变量的值, 简而言之就是连续赋值
Swift: 不允许连续赋值

错误案例：
var num4: Int
var num5: Int
num4 = num5 = 10
*/

/*
范围运算符:
封闭范围运算符
包含区间内所有值 a...b 从a到b,并包括a和b的值 例如: 1...5

半封闭的区域运算符
包含头不包含尾 a..<b 从a到b,包括a不包含b 例如: 1..<5
在Swift2.0之前，半封闭的区域定义为： a..b
*/

// 应用场景: 遍历, 数组等
/*
OC中的forin循环
for (i in arr) {
    
}
*/
for i in 0...5 {
    print(i)
}

for i in 0..<5 {
    print(i)
}


/**
Bool类型

C语言和OC并没有真正的Bool类型
C语言的Bool类型非0即真
OC语言的Bool类型是typedef signed char BOOL;
Swift引入了真正的Bool类型
Bool true(真) false(假)

OC中if可以是任何整数(非0即真),但实际开发中这样去判断并不严谨
例如：if (256) 时并不为真

Swift中if的条件只能是一个Bool的值或者是返回值是Bool类型的
例如：表达式(==、!=、>、>=、<、<=等等)
*/

let flag: Bool = true
if flag {
    print("flag值为真")
}

if 1 < 2 {
    print("1<2")
}










