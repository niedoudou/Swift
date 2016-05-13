//
//  main.swift
//  05-继承


import Foundation

/*
继承语法
继承是面向对象最显著的一个特性, 继承是从已经有的类中派生出新的类
新的类能够继承已有类的属性和方法, 并能扩展新的能力

语法:
class 子类: 父类 {
}

注意:Swift和OC一样没有多继承
*/

/*
方法重写: override
重写父类方法, 必须加上override关键字
*/

class Animal {
    var name: String?
    
    func eat() {
        print("Animal \(__FUNCTION__)")
    }
}

class Dog: Animal {
    var age: UInt8?
    
    func sleep() {
        print("Dog \(__FUNCTION__)")
    }
    
    // 如果要重写父类方法, 必须加上override关键字, 明确表示重写父类方法
    override func eat() {
        // 如果想要继续执行父类的方法，需用super关键字来调用
        super.eat()
        print("Dog \(__FUNCTION__)")
    }
}

let dog = Dog()
dog.name = "ahuang"
dog.age = 10

dog.eat()


/*
重写属性
无论是存储属性还是计算属性, 都只能重写为计算属性

注意：
1.读写计算属性/存储属性, 是否可以重写为只读计算属性? (权限变小)不可以
2.只读计算属性, 是否可以在重写时变成读写计算属性? (权限变大)可以
*/
// 父类（动物类）
class Animal1 {
    // 存储属性
    var name: String?
    // 计算属性
    var age: UInt8? {
        get {
            return 18
        }
        set {
            print("name age is \(newValue)")
        }
    }
    // 只读计算属性
    var number: String? {
        get {
            return "110"
        }
    }
}

class Dog1: Animal1 {
    var speed: Int?
    
    // 1.重写父类的存储属性
    // 但不可以将父类的存储属性又重写为存储属性, 因为这样没有意义
//    override var name: String?  // 错误
    // 但可以将父类的存储属性重写为计算属性
    override var name: String? {
        get {
            return "大欢"
        }
        
        set {
            print("name is \(newValue)")
        }
    }
    
    // 2.重写父类的读写计算属性
    // 可以将父类的计算属性重写为计算属性, 同样不能重写为存储属性
//    override var age: UInt8?  // 错误
    override var age: UInt8? {
        get {
            return 10
        }
        
        set {
            print("age is \(newValue)")
        }
    }
    
    // 3.重写父类的只读计算属性
    // 只读计算属性, 可以在重写时变成读写计算属性
    override var number: String?
    {
        get {
            return "10086"
        }
        
        set {
            print("number is \(newValue)")
        }
    }
}


/*
重写属性观察器
1.不能给lazy属性重写属性观察器
2.不能给计算属性设置属性观察器
*/


/*
利用final关键字防止重写
final关键字既可以修饰属性, 也可以修饰方法, 并且还可以修饰类
被final关键字修饰的属性和方法不能被重写
被final关键字修饰的类不能被继承
*/

final class Animal2 {
    final var name: String?
    
    final func show() {
        print("name is \(name)")
    }
}

//class Dog2: Animal2 {
//    override var name: String? {
//        get {
//            return "xixix"
//        }
//        set {
//            
//        }
//    }
//    
//    override func show() {
//        print("name is \(name)")
//    }
//}