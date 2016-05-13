//
//  main.swift
//  02-Swith


import Foundation

/*
Swith
OC:
不加break可以穿透
可以不写default
default位置可以随便放
在case中定义变量需要加大括号, 否则作用域混乱
不能判断对象类型

char score = 'B';
switch (score) {
case 'A':{
    NSLog(@"优秀");
}
break;

case 'B':{
    NSLog(@"良好");
}
break;

case 'C':{
    NSLog(@"及格");
}
break;

case 'D':{
    NSLog(@"不及格");
}
break;

default:
break;


Swift: 可以判断对象类型, OC必须是整数
Swift不可以穿透
Swift可以不写break

Swift中在case中定义变量不用加大括号
*/

let name = "xiaoming"
switch name {
    case "xiaoming":
        var name = ""
        print("xiaoming")
    case "xiaohua":
        print("xiaohua")
    case "huanhuan":
        print("huanhaun")
    default:
        print("qita")
}

// 因为不能穿透所以只能这么写
let name1 = "dahuan"
switch name1 {
     case "xiaohuan", "dahuan":
         print("刘宇佳欢")
    
     case "daqing":
         print("大庆")
    
     default:
         print("其他")
}

// 如果就是想执行完一条case之后，想继续执行下一条case，就要用到一个新的关键字：fallthrough
let num = 1
switch num {
    
    case 1:
        print(1)
        fallthrough
    case 2:
        print(2)
        fallthrough
    case 3:
        print(3)
    default:
        print("其他")
}

// fallthrough并不是在任何情况下都有效，当你在Switch里使用Value Binding技术的时候，fallthrough就被禁止了。Value Binding在下面会讲到。

/**
switch中如果覆盖了所有可能的case，可以不用写default
否则要写default，且default位置只能在最后
*/
let flag = true
switch flag {
    case true:
        print("zhen")
    case false:
        print("jia")
}

// Switch的区间匹配
let score = 50
switch score {
    case 90...100:
        print("优秀")
    case 70..<90:
        print("良好")
    case 60..<70:
        print("及格")
    default:
         print("渣渣")
}


// Switch和元祖匹配
let position = (0, 10)
switch position {
case (0, 0):
    print("坐标在原点")
case (0...10, 0...10):  // 可以在元祖中再加上区间
    print("坐标的X和Y在1~10之间")
case (0, _): // 对于不想关心的值，可以用下划线_跳过
    print("坐标Y在X轴上")
    
default:
    print("其他")
}


/**
Value Binding
针对元组，Switch还支持类似于Optional Binding的Value Binding，就是能把元组中的各个值提取出来，然后直接在下面使用
当你在一个case里使用Value Binding的时候，如果你同时也在它的上一个case里使用了fallthrough，这是编译器所不允许的
*/
let position1 = (10, 100)
switch position1 {
case (let x, 10):
    print("x: \(x)")
//    fallthrough // 在Value Binding的时候，不能使用fallthrough关键字
case (1, let y):
    print("y: \(y)")
case (let x, let y):
    print("x: \(x), y: \(y)")
}

// 把let放在外面和放在里面为每一个元素单独写上let是等价的。
let position2 = (10, 100)
switch position2 {
case let (x, 10):
    print("x: \(x)")
case let (1, y):
    print("y: \(y)")
case let (x, y):
    print("x: \(x), y: \(y)")
}


// 根据条件绑定
// 只有where后面的条件表达式为真才赋值并执行case后的语句
var point = (10, 2)
switch point {
case var(x, y) where x > y:
    print("x= \(x) y= \(y)")
default:
    print("Other")
}