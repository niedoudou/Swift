//
//  main.swift
//  07-结构体


import Foundation


/*
结构体:
Swift中的结构体是一类类型, 可以定义属性和方法
格式:
struct 结构体名称 {
结构体属性和方法
}
*/

/*
结构体构造器(构造函数):
Swift要求实例化一个结构体或类的时候, 所有的成员变量都必须有初始值(缺省值)
构造函数的意义就是用于初始化所有成员变量的, 而不是分配内存, 分配内存是系统帮我们做的

如果结构体中的所有属性都有默认值, 可以调用()构造一个结构体实例
如果结构体中的属性没有默认值, 可以自定义构造器, 并在构造器中给所有的属性赋值
其实结构体有一个默认的逐一构造器, 用于在初始化时给所有属性赋值
*/

// 1.结构体的属性没有默认值
struct Position {
    var pointX: Float
    var pointY: Float
}

// 实例化结构体并使用逐一构造器实例化结构体
var position: Position = Position(pointX: 10, pointY: 10)

print("pointX: \(position.pointX), pointY: \(position.pointY)")

// 2.结构体的属性有默认值
struct Position1 {
    var pointX: Float = 12
    var pointY: Float = 20
}

// 结构体中的属性有默认值(缺省)，直接使用()构造一个结构体
var position1 = Position1() // ＝＝ alloc init
print("pointX: \(position1.pointX), pointY: \(position1.pointY)")

// 结构体中属性的访问和修改
position1.pointX = 100
position1.pointY = 200
print("pointX: \(position1.pointX), pointY: \(position1.pointY)")


/*
常见的一些结构体
CGRect CGPoint CGSize .....
*/

// 构造CGPoint
let point = CGPointMake(10, 10)
let point1 = CGPoint(x: 10, y: 10)

// 构造CGSize
let size = CGSizeMake(100, 100)
let size1 = CGSize(width: 100, height: 100)

// 构造CGRect
let rect = CGRectMake(10, 10, 100, 100)
let rect1 = CGRect(x: 10, y: 10, width: 100, height: 100)
let rect2 = CGRect(origin: point, size: size)

/*
OC: self.imageView.frame.origin.y = 10  错误
Swift: self.imageView.frame.origin.y = 10  正确
*/


/*
结构体中定义成员方法
在C和OC中结构体只有属性, 而Swift中结构体中还可以定义方法
*/
struct Size {
    var width: Float
    var height: Float
    
    // 给结构体添加一个成员（对象）方法
    // 结构体中成员(对象)方法可以访问成员属性
    func getHeight() -> Float
    {
        return height
    }
}

var size2 = Size(width: 100, height: 100)
// 访问结构体中的成员方法
print(size2.getHeight())

/*
结构体是值类型:
注意：结构体和枚举都是值类型
*/
struct Size1 {
    var width: Float
    var height: Float
}
var size3 = Size1(width: 100, height: 200)
var size4 = size3

// 输出结果 width: 100.0, height: 200.0
print("width: \(size3.width), height: \(size3.height)")
// 输出结果 width: 100.0, height: 200.0
print("width: \(size4.width), height: \(size4.height)")

size4.height = 150

// 输出结果 width: 100.0, height: 200.0
print("width: \(size3.width), height: \(size3.height)")
// 输出结果 width: 100.0, height: 150.0
print("width: \(size4.width), height: \(size4.height)")

/*
在修改size4的宽度之后，我们发现size3和zise4的宽度输出不同

那是因为结构体是值类型, 结构体之间的赋值其实是将size3中的值完全拷贝一份到zise4中, 所以他们是两个不同的实例，所以输出的值也不相同
*/


/*
存储属性：
其实Swift中的存储属性就是以前学习OC中的普通属性
在结构体或者类中定义的属性, 默认就是存储属性
*/

/*
常量存储属性:
常量存储属性只能在定义时或构造时修改, 构造好一个对象之后不能对常量存储属性进行修改
*/
struct Size2 {
    // 常量存储属性
    let width: Float
    // 普通存储属性
    var height: Float
}

var size5 = Size2(width: 20, height: 20)
size5.height = 200
// 构造好结构体后不能修改常量存储属性的值
//size5.width = 200  // 错误


/*
注意：
如非必要，不要用常量(let)来修饰结构体
因为结构体是值类型, 所以不能修改结构体常量中的属性
不能修改结构体常量对象中的值, 因为他指向的对象是一个常量
*/

struct Size3 {
    var width: Float
    var height: Float
}

// 构造一个结构体常量对象
let size6 = Size3(width: 20, height: 20)
// 因为常量修饰的结构体，所以不能修改结构体中属性的值
//size6.width = 200   // 错误
//size6.height = 200  // 错误

// 不能修改结构体常量对象的值
//size6 = Size3(width: 20, height: 20)  //错误

