//
//  main.swift
//  05-闭包


import Foundation

/*
Swift闭包

函数就是闭包的一种表现类型, 类似于OC语言的block

闭包功能强大, 灵活多变, 便于使用, 实际上闭包是一种匿名的函数.

闭包可以捕获和存储其所在上下文中任意常量和变量的引用, 这就是所谓的闭合并包裹着这些常量和变量，俗称闭包。
Swift会为开发者管理在捕获过程中涉及到的内存操作。

全局函数和嵌套函数其实就是特殊的闭包。
闭包的形式有：
（1）全局函数都是闭包，有名字但不能捕获任何值。
（2）嵌套函数都是闭包，且有名字，也能捕获封闭函数内的值。
（3）闭包表达式都是无名闭包，使用轻量级语法，可以根据上下文环境捕获值。

Swift中的闭包有很多优化的地方:
(1)根据上下文推断参数和返回值类型
(2)从单行表达式闭包中隐式返回（也就是闭包体只有一行代码，可以省略return）
(3)可以使用简化参数名，如$0, $1(从0开始，表示第i个参数...)
(4)提供了尾随闭包语法(Trailing closure syntax)

闭包表达式:
闭包表达式的类型和函数的类型一样, 是参数加上返回值, 也就是in之前的部分
in关键字的目的是便于区分返回值和执行语句, 如下:
{
(参数列表) -> 返回值类型 in
执行语句
}

对比函数的定义,如下:
func 函数名(参数列表) -> 返回值类型
{
执行语句
}
我们可以看到,闭包与函数的主要区别是少了 func 函数名这一块, 也就是说, 函数与闭包的主要区别就是闭包是匿名的.
*/

/*
闭包示例:
定义一个闭包, 功能是计算两个数之和, 使用一个变量来接受该闭包
闭包赋值给一个变量之后,该变量可以直接当函数使用
*/
// 1.闭包带参数有返回值的完整写法
var results = {
    (a: Int, b: Int) -> Int in
    return a + b
}
print(results(10, 20))

// 2.定义完闭包之后可直接调用该闭包
var results1 = {
    (a: Int, b: Int) -> Int in
    return a + b
}(20, 30)
print(results1)

// 3.闭包的类型推断
// 跟胡闭包传入的实参类型，来确定参数的类型以及返回值的类型
var results2 = {
    (a, b) in
    return a + b
}(20, 30)
print(results2)

// 4.闭包省略 return 语句
// 当闭包的内容只有一行, 且该行语句是返回一个值, 那么此时 return 可以省略
var results3 = {
    (a, b) in
    a + b
}(40, 30)
print(results3)

// 5.省略形参名和 in 关键字
// Swift可以通过 $0 ,$1  ...来引用第一个, 第二个形参, 第N个形参...
var results4 = {
    $0 + $1
}(40, 40)
print(results4)

// 6.尾随闭包
// 就是当函数的最后一个参数是函数类型时, 调用函数时, 可传入一个闭包, 该闭包可以放在圆括号之外
// 首先我们来定义一个参数带有 函数类型的 函数
func loadData(url: NSURL?, dict: [String : Any], fun:(JSON: AnyObject?, error: NSError?) -> Void) -> Void
{
    // 进行网络请求...
    print("url: \(url), dict: \(dict)")

    // 模拟网络返回的数据
    let JSON = [1, 2, 3, 4]
    
    // 模拟错误信息
    let error = NSError.init(domain: "你手机断网了", code: 404, userInfo: [:])
    
    // 回调数据
    fun(JSON:nil, error: error)
}

let url: NSURL? = NSURL(string: "http://wwww.baidu.com")
// 注意： 字典的类型一定要个参数定义的类型保持一致
let dict: [String : Any] = ["name" : "dahuan"]

// 模拟网络请求数据
loadData(url, dict: dict, fun: { (JSON, error) -> Void in
    print("JSON: \(JSON), error: \(error)")
})

/*
上面我们调用的方式为
loadData(num1:, num2:, fun:{闭包体})

使用尾随闭包则可以写的更简洁
loadData(num1:, num2:){闭包体}
*/

loadData(url, dict: dict) { (JSON, error) -> Void in
    print("JSON: \(JSON), error: \(error)")
}


/*
闭包可以根据环境上下文捕获到定义的常量和变量，闭包可以引用和修改这些捕获到的常量和变量，
就算在原来的范围内定义为常量或者变量已经不再存在的时候依旧可以使用（很牛逼）。
*/

// 在Swift中闭包的最简单形式是嵌套函数。
func increment(amount: Float) -> () -> Float
{
    var total: Float = 0.0;
    func incrementAmount() ->Float {
        total += amount // total是外部函数体内的变量，这里是可以捕获到的
        return total
    }
    
    // 当执行到这一句时total，amount参数就应该被释放了, 但是由于在内部函数中使用到了它, 所以它被捕获了
    return incrementAmount // 返回的是一个嵌套函数（闭包）
}

// 被捕获的值会和与之对应的方法绑定在一起, 同一个方法中的变量会被绑定到不同的方法中
var incFunc = increment(10)
print("第一次： \(incFunc())")  // 输出值为：10
// 这里是没有改变对incFunc的引用，所以会保存之前的值(total)
print("第二次： \(incFunc())")  // 输出值为：20
print("第三次： \(incFunc())")  // 输出值为：30

// 当incFunc指向别的方法的时候，那么以前引用的常量和变量都被释放
incFunc = increment(10)
print("第一次： \(incFunc())")  // 输出值为：10
// 这里是没有改变对incFunc的引用，所以会保存之前的值(total)
print("第二次： \(incFunc())")  // 输出值为：20
print("第三次： \(incFunc())")  // 输出值为：30

