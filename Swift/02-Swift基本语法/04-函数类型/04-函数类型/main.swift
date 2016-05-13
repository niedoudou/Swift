//
//  main.swift
//  04-函数类型


import Foundation

/*
// 函数类型:
// 类似于C语言的指向函数的指针
// 类似于OC语言的block
// 函数类型是由函数的参数类型和返回值类型组成的

// 每一个函数都有特定的函数类型，可以充当参数类型和函数的返回类型。例如：
*/

// 下面是另一个例子，不带任何参数或返回值的函数：
func printHelloWorld()
{
    print("hello, world")
}
// 这个函数的类型是 ()->() , 或者"函数没有参数，并返回void。"函数不显式的指出一个返回值类型是void，在swift中相当于一个空元组，显示为()。

// 该函数类型是：(Int, Int) -> Int
func addTwoInts(first: Int, second: Int) -> Int
{
    return first + second;
}

// 参数类型是：(Int, Int) -> Int
func multiplyTwoInts(first: Int, second: Int) -> Int
{
    return first * second;
}

// 这个例子中定义了两个简单的数学函数addTwoInts和multiplyTwoInts。每个函数接受两个int值，并返回一个int值，执行适当的数学运算并返回结果。
// 这两个函数的类型是(Int, Int)->Int。可以解读为："这个函数类型，它有两个int型的参数，并返回一个int类型的值。"

// 在Swift中你可以像任何其他类型一样的来使用函数类型。
// 例如，你可以定义一个常量或变量为一个函数类型，并指定适当的函数给该变量：
var mathFunction: (Int, Int) -> Int = addTwoInts

// 以上代码可解读为："定义一个名为mathFunction变量，该变量的类型为'一个函数，它接受两个int值，并返回一个int值。'设置这个新的变量来引用名为addTwoInts功能。"
// 该addTwoInts函数具有与mathFunction相同类型的变量，所以这个赋值在能通过Swift的类型检查。
print(mathFunction(10, 20))  // 输出值为：30

// 不同的函数相同的匹配类型可以分配给相同的变量, 也同样的适用于非函数性类型:
mathFunction = multiplyTwoInts
print(mathFunction(10, 20))   // 输出值为：200



/**
函数类型的参数
函数类型可以作为函数的参数
*/
// 这个例子中定义了一个名为mathResult函数，它有三个参数。
// 第一和第二个参数first、second都是Int类型。被用作用于提供数学函数的两个输入值, 第三个参数名为mathFunction，类型为(Int, Int)->Int。你可以传入符合的任何函数类型作为此函数的第三个参数。

func mathResult(first: Int, second: Int, mathFunction: ((Int, Int) -> Int)) -> Int
{
    return mathFunction(first, second)
}

var mathFunction1: (Int, Int) -> Int = addTwoInts

let result = mathResult(10, second: 20, mathFunction: mathFunction1)
print("result: \(result)")  // 输出值为： 30

mathFunction1 = multiplyTwoInts
let result1 = mathResult(10, second: 20, mathFunction: mathFunction1)
print("result1: \(result1)")  // 输出值为： 200



/**
函数类型的返回值
函数类型可以作为函数返回值
*/

// 下面的例子定义了两个简单的函数
// 这两个函数都有一个相同的类型 (Int, Int) -> Int
func max(a: Int, b: Int) -> Int
{
    return a > b ? a : b
}

func min(a: Int, b: Int) -> Int
{
    return a < b ? a : b
}

// chooseFunc函数的返回类型是 (Int, Int) -> Int
// chooseFunc的返回类型基于max或min的函数类型
func chooseFunc(isMax: Bool) -> (Int, Int) -> Int
{
    return isMax ? max : min
}

// 声明一个变量来指向一个函数的返回值(本质上还是指向的是一个函数)
var function: (Int, Int) -> Int = chooseFunc(true)
print(function(2, 3))  // 输出值为： 3

function = chooseFunc(false)
print(function(2, 3))  // 输出值为： 2

// 此处因为chooseFunc包含返回的类型，所以minFunction函数的类型可以省略
// 可理解为chooseFunc(false)是一个显示的类型，因为返回值确定了是什么类型
var minFunction = chooseFunc(false)
print(minFunction(2, 3))  // 输出值为： 2


/**
嵌套函数
迄今为止我们遇到的都是全局函数，在全局范围内定义。
其实你还可以在其他函数中定义函数，被称为嵌套函数。
*/

// 嵌套函数默认对外界是隐藏的，但仍然可以调用和使用其内部的函数。内部函数也可以返回一个嵌套函数，允许在嵌套函数内的另一个范围内使用。
func chooseFunction(isMax: Bool) -> (Int, Int) -> Int
{
    func max(a: Int, b: Int) -> Int
    {
        return a > b ? a : b
    }
    
    func min(a: Int, b: Int) -> Int
    {
        return a < b ? a : b
    }
    
    return isMax ? max : min
}
var maxFunc = chooseFunction(true)

print(maxFunc(10, 20))   // 输出值为：20


