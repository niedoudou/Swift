//
//  main.swift
//  03-函数


import Foundation

/*
函数
完成某个特定任务的代码块

格式:
func 函数名称(参数名:参数类型, 参数名:参数类型...) -> 函数返回值 {函数实现部分}
*/
// 无参无返回值
func say() -> Void
{
    print("Hello World")
}
say()

// 如果没有返回值可以不写
func say1()
{
    print("Hello World")
}
say1()

// 有参无返回值
func sayWithName(name: String)
{
    print("hello \(name)")
}
sayWithName("大欢")

// 无参有返回值
func show() -> String
{
    return "大欢"
}
let name = show()
print("name: \(name)")

// 有参有返回值
func show(name: String) -> String
{
    return "刘宇佳\(name)"
}
let name1 = show("欢")
print("name1: \(name1)")

/*
内部函数: 默认情况下的参数都是内部参数
外部函数: 如果有多个参数的情况, 调用者并不知道每个参数的含义, 只能通过查看头文件的形式理解参数的含义, 想要调用者直观的知道参数, 这里就需要用到外部函数
*/
// name1:外部参数, name2:内部参数
func show1(name1 name2: String)
{
    // 方法内部使用内部参数
    print("name2: \(name2)")
}
show1(name1: "huanhuan")


/*
扩展
在Swift2.0之前，在参数前面加上#相当于该参数即是内部参数, 也是外部参数，例如
func show(#name: String #age: Int16)
{
print("name is \(name), age is \(age)")
}
show(name: "大欢" age:18)
*/

// Swift2.0之后, 第一个参数为内部参数, 取而代之第二个参数开始默认既是外部又是内部, 例如
func showWithName1(name: String, age: Int)
{
    print("name is \(name), age is \(age)")
}
showWithName1("大欢", age: 18)


/*
默认参数
可以在定义函数的时候给某个参数赋值, 当外部调用没有传递该参数时会自动使用默认值
*/
func showWithName2(name: String, age: Int = 18)
{
    print("name is \(name), age is \(age)")
}
showWithName2("大欢欢")
showWithName2("小欢欢", age: 38)

/*
常量参数和可变参数
默认情况下Swift中所有函数的参数都是常量参数, 如果想成为变量参数, 那么必须在参数前加上var, 例如：
*/
func showWithName3(name: String, var age: Int)
{
    age++
    print("name is \(name), age is \(age)")
}
showWithName3("欢欢", age: 18)

/*
inout参数
如果想在函数中修改外界传入的参数, 可以将参数的var换成inout, 这样直接传递参数本身而不是参数的值
*/
func showWithName4(name: String, inout age: Int)
{
    age++
    print("name is \(name), age is \(age)")
}
var age = 18
showWithName4("小庆庆", age: &age)
print("age: \(age)")

/*
可变参数
一个可变参数的参数接受零个或多个指定类型的值。
*/
func sumFunc(numbers: Float ...) -> Float
{
    var total: Float = 0;
    for number in numbers {
        total += number
    }
    
    return total
}
let sum = sumFunc(20, 18, 189, 199, 101)
print("sum: \(sum)")



