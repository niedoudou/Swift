//
//  main.swift
//  04-分支


import Foundation

/*
if 语句
注意：
1.if后的圆括号可以省略
2.只能以bool作为条件语句
3.条件语句语句后的大括号不可以省略
*/
let num1 = 3.0
let num2 = 4.0

if num1 > num2 {
    print("num1 > num2")
}
else if num1 < num2 {
    print("num1 < num2")
}
else{
    print("num1 == num2")
}

/*
三目运算
Swift中的三目运算基本用法和OC一样
*/
let str: String = num1 > num2 ? "num1 > num2" : "num1 <= num2"
print(str)

/**
循环
Swift中使用for循环和OC差不多
注意: for后的圆括号可以省略
*/

// 注意： for循环中的idx只能定义为变量（var）
// Swift3.0建议写法为 forin + 区间
for var idx = 0; idx < 10; idx++ {
    print(idx)
}

// 注意：forin中的idx可以不用定义类型和常量或变量
// Swift开发中的建议写法
for idx in 0...10 {
    print(idx)
}

/**
while循环
1.while后的圆括号可以省略
2.只能以bool作为条件语句
*/

var index = 10
while index > 2 {
    index--
    print(index)
}

/**
do while循环
OC:
int index = 10;
do {
   index--;
} while (index > 0);

Swift2.0:
repeat while, do用于捕捉异常
*/

var idx = 10
repeat {
    idx--
    print(idx)
} while (idx > 2)



