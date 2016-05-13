//
//  main.swift
//  02-常量和变量


import Foundation

/*
OC    NSLog(@"Hello, World!");
Swift print("Hello, World!")

Swift1.2:println("Hello World!")
Swift2.0:print("Hello World!")

在 Swift 中使用 print 替代 OC 中的 NSLog
注意：Swift中句尾可以不用添加 “;”

*/

/*
常量和变量

var 定义变量，设置之后可以修改
let 定义常量，设置之后不可以修改

常量:
OC: const int num = 10;
Swift: let num: Int = 10

变量: int num = 10
Swift: var num: Int = 10

注意：
1.先定义再初始化，需在在定义时告诉编译器数据类型
2.定义的同时初始化，可以不用写数据类型，编译期会根据初始化的值自动推断出变量的类型
*/

//let num: Int = 10
// Swift中可以根据后面的赋值来直接推算出类型
//let num = 10
// 注意：常量一旦定义好不可以修改
//num = 20

// 定义的时候并赋值可以不用声明类型
var num = 10
num = 20

// 只定义，不赋值，不可以省略类型
var num1: Int
num1 = 30

/*
基本数据类型
Swift中常见的基本数据类型有
*/

// 定义一个整型
// 如果定义一个整型（或者别的类型）的时候，没有指定类型，那么需要注意，后面的复制一定要和我们想要定义的类型抱持一致
let intValue:Int = 10

// 定义一个浮点型
// CGFloat
let floatValue: Float = 10.0     // 表示32位浮点数
let doubleValue: Double          // 表示64位浮点数

// 如果按照长度划分,Swift中的长短比OC更加精确
let intValue1: Int8
let intValue2: Int16
let intValue3: Int32
let intValue4: Int64

// OC 中定义一个无符号的整型  NSUInteger = -10
// 有符号无符号, 默认是有符号的(UInt8/UInt16/UInt32/UInt64)
let uintValue1: UInt16

// Swift是类型安全的语言, 如果取值错误会直接报错, 而OC不会
// let uintValue2: UInt32 = -10  // 错误

// 数据类型的相互赋值(隐式类型转换), 而OC不会
/*
int num1 = 10;
Float num2 = num1
*/
let value1: Int = 19
//let value2: Float = value1  // 错误

// Swift不允许隐式类型转换, 但可以使用显示类型转换(强制类型转换)
let value2: Float = Float(value1)





