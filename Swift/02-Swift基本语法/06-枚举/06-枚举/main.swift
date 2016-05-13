//
//  main.swift
//  06-枚举


import Foundation

/*
Swift枚举:
Swift中的枚举比OC中的枚举强大, 因为Swift中的枚举是一等类型, 它可以像类和结构体一样增加属性和方法
格式:
enum Method{
case 枚举值
}
*/

// 声明一个方向的枚举
enum DirectionType {
//    case Left
//    case Right
//    case Top
//    case Bottom
    // 也可以连在一起写, 用 "," 分开
    case Left, Right, Top, Bottom
}
// 可以使用枚举类型的常量或变量来接受值
var type0: DirectionType = DirectionType.Left

// 也可以这样简写
var type1: DirectionType = .Left
// 注意：如果接收的常量或变量没有声明类型，那么不能简写
//var type2 = .Left  // 错误

// 如果接受的时候没有声明类型，那么不能简写
var type2 = DirectionType.Left


// Switch匹配枚举值
let type: DirectionType = .Top
switch type {
     case .Left:
         print("左")
     case .Right:
         print("右")
     case .Top:
         print("上")
     case .Bottom:
         print("下")
}


/*
原始值:
OC中枚举的本质就是整数, 所以OC中的枚举是有原始值的, 默认是从0开始
Swift中的枚举默认是没有原始值的, 但是可以在定义时告诉系统让枚举有原始值
格式:
enum Method: 枚举值原始值类型 {
     case 枚举值
}
*/
// 如果定义枚举原始值的类型，那么默认有原始值(原始值为0), 后面的值默认+1
enum DirectionType1: Int {
    case Left, Right, Top, Bottom
}
print(DirectionType1.Top.rawValue)


// 和OC中的枚举一样, 也可以指定原始值, 后面的值默认+1
enum DirectionType2: Int {
    case Left = 1, Right, Top, Bottom
}

// 获取原始值
print(DirectionType2.Left.rawValue)
print(DirectionType2.Right.rawValue)
print(DirectionType2.Bottom.rawValue)

/*
Swift中的枚举除了可以指定整形以外还可以指定其它类型, 但是如果指定其它类型, 必须给所有枚举值赋值, 因为不能自动递增
*/
enum DirectionType3: Float {
    case Left = 0.5, Right = 1.3, Top = 2.3, Bottom = 9
}
print("------------------")
print(DirectionType3.Left.rawValue)
print(DirectionType3.Right.rawValue)
print(DirectionType3.Bottom.rawValue)


// 设置枚举的原始值为String
enum DirectionType4: String {
    case Left = "left", Right = "right", Top = "top", Bottom = "bottom"
}

/*
通过原始值创建枚举值
注意:
1.原始值区分大小写
2.返回的是一个可选值,因为原始值对应的枚举值不一定存在
*/
let type3: DirectionType4? = DirectionType4(rawValue: "left")
print(type3)

/*
枚举相关值(Associated Values):
在 Swift 中，我们还可以定义这样的枚举类型，它的每一个枚举项都有一个附加信息，来扩充这个枚举项的信息表示，这又叫做关联值。
例如：
定义一个枚举类型 Shape 来表示形状
这个形状可以是矩形，也可以是圆形
*/

enum ShapeType {
    // 表示一个矩形
    case Rectangle(rect: CGRect)
    // 表示一个圆形
    case Circle(center: CGPoint, radius: Float)
}

// 表示一个正方形的枚举
//let shape: ShapeType = .Rectangle(rect: CGRect(x: 10, y: 10, width: 100, height: 100))
let shape: ShapeType = .Circle(center: CGPoint(x: 100, y: 100), radius: 200)

// 利用switch提取枚举关联值
switch shape {
     case .Rectangle(let rect):
         print(rect)
     case let .Circle(center, radius):
         print("center: \(center), radius: \(radius)")
}




