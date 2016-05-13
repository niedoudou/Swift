//
//  main.swift
//  06-可选值


import Foundation

/*
可选值
Swift的nil也和Objective-C有些不一样，在Objective-C中，只有对象才能为nil，而在Swift里，当基础类型（整形、浮点、布尔等）没有值时，也是nil，而不是一个初始值
Swift中没有初始值的值，是不能使用的，这就产生了Optional类型。

optionals有两种状态:
1.有值 2.没有值, 没有值就是nil

定义一个Optional的值很容易，只需要在类型后面加上问号 “?” 就行了，例如：
var value: Int?

一个Optional值和非Optional值的区别就在于：
Optional值未经初始化虽然为nil，但普通变量连nil都没有, 例如:

未被初始化，但是是一个Optional类型，为nil
var value1: Int?
print(value1)  // 输出nil

未被初始化，也不是Optional类型
var value2: Int
print(value2)  // 使用时出错
*/


/*
提取可选类型的值(强制解析)
Optional类型的值不能被直接使用(如赋值操作)，因为可选类型有两种状态有值和没有值，所以需要告诉编译器到底有没有值
强制解析可选类型的值，在可选类型后面添加“!”即可，例如：
var value: Float? = 10.0
var result: Float = value!

注意:
如果强制解析value, 但是value中没有值时会引发一个运行时错误,例如：
var value: Float?
var result: Float = value! // 报错
*/

//var value: Int? = 10
//var result: Int = value!
//print(result)

/*
可选绑定
当我们不确定Optional是否有值的时候，该怎么去操作呢？
如果是一个Optional值，可以直接放到条件判断语句中, 判断可选类型是否有值
*/

var value: Int?
// 当value值不为nil的时候，才进行赋值
if nil != value {
    var result: Int = value!
    var result1: Int = value!
}

/*
可选绑定
这样实现看似合理，但是在某种情况下会非常不爽，比如你在 nil != value 条件成真后接着在上下文中多次使用value，那么每次使用value的时候都会去强制解包
为了避免在条件判断语句后执行一次或更多次的拆包，Swift引进了可选绑定(Optional Binding)，我们就可以这样做：
*/
// 如果可选类型value有值，那么就把Value中的值提取出来赋值给tmpValue，同时执行if中的语句
if let tmpValue = value {
    // 如果value有值，在if语句中就可以直接使用tmpValue，而不用去强制解析value
    var result: Int = tmpValue
    var result1: Int = tmpValue
}

// 通过在条件判断语句中把Optional值直接给一个临时常量，Swift会自动检测Optional是否包含值，如果包含值，会隐式的拆包并给那个临时常量，在接下来的上下文中就能直接使用这个临时常量了

// OC: [NSURL URLWithString:@"http://www.baidu.com"];
var url: NSURL? = NSURL(string: "http://www.baidu.com")

// 注意： 当我们不确定Optional类型中是否有值的时候，不要直接使用强制解析（!）, 建议选用可选绑定
if let tmpUrl = url {
    var request: NSURLRequest = NSURLRequest(URL: tmpUrl)
}


/*
可选项
?? 是一个非常有用的操作符，能够快速对 nil 进行判断
如果对象是 nil，则使用 ?? 后面的值代替前面的 nil 值参与计算
这一技巧在 UITableView 的数据源方法中尤为重要
*/
var num: Int? = 10
let result: Int = num ?? 0
print(result)



