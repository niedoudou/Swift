//
//  main.swift
//  01-类&属性&方法


import Foundation

/*
类：
Swift中的结构体和类非常相似, 但是又有很多不同

类格式:
class 类名称 {
类的属性和方法
}
*/


// 声明一个类
class Person {
    // 普通存储属性
    var name: String = "dahuan"
    var age: UInt8 = 18
    
    // 对象方法
    func show()
    {
        // 注意，在swift中，能不用self就尽量不要使用self
        // 在闭包中使用一个全局属性，就不能够省略self
        // 在方法中，如果方法的参数和全局属性重名，为了区分也不能够省略self
        print("name: \(name), age: \(age)")
    }
}

// 1.类没有逐一构造器
//var person: Person = Person(name: "huanhuan", age: 19)  // 错误


// 2.类是引用类型
// 注意：结构体和枚举都是值类型，类是引用类型
// 对象之间的赋值其实是将person1指向了person2的存储控件, 所以他们是两个指向同一块存储空间, 修改其中一个必然会影响到另外一个
var person1 = Person()
var person2 = person1

// 输出结果为 name: dahuan, age: 18
person1.show()
// 输出结果为 name: dahuan, age: 18
person2.show()

// 修改person2种属性的值
person2.name = "xiaohua"

// 输出结果为 name: xiaohua, age: 18
person1.show()
// 输出结果为 name: xiaohua, age: 18
person2.show()


/*
恒等运算符
用于判断是否是同一个实例, 也就是是否指向同一块存储空间
=== !==
*/

if person1 === person2 {
    print("person1和person2指向同一块存储空间")
}

var person3 = Person()
if person1 !== person3 {
    print("person1和person3指向不是同一块存储空间")
}


/*
Swift中的对象属性：
*/

/*
常量存储属性:
类和结构体一样，常量存储属性只能在定义时或构造时修改，构造好一个对象后不能对常量存储属性做修改
*/

class Person1 {
    // 普通存储属性
    var name: String = "大欢"
    // 常量存储属性
    let age: UInt8 = 18
}

var person4 = Person1()
person4.name = "小欢"

// 构造好对象之后不能修改常量存储属性
//person4.age = 38  // 错误


/*
类常量
因为结构体和枚举都是值类型，用常量(let)来修饰对象，不能修改结构体常量对象中属性的值(因为指向的对象是一个常量)，也不能修改常量的指向
因为类是引用类型，用常量(let)来修饰对象，可以修改对象中属性的值(因为指向的对象不是一个常量)，不可以修改类常量的指向
注意：结构体和枚举都是值类型，类是引用类型
*/

class Person3 {
    // 普通存储属性
    var name: String = "dahuan"
    var age: UInt8 = 18
}

// 构造一个类常量对象
let person5 = Person3()

// 可以修改类常量中的值, 因为他指向的对象不是一个常量
person5.age = 100
person5.name = "xiaohuan"


/*
延迟存储属性
懒加载
用lazy
*/
class Line {
    var start: Float = 10
    var end: Float = 30
    
    // 加上lazy, 代表使用length时才会加载
    // 通过闭包来懒加载
    // 注意：在闭包中使用全部属性，不能够省略self
    // 完整的lazy书写方法
    /*
    lazy var length: Float = {
        () -> Float in
        print("懒加载")
        return self.end - self.start
    }()
    */
    
    // lazy实现的简写
    lazy var length: Float = {
        print("懒加载")
        return self.end - self.start
    }()
}

var line = Line()
print(line.length)

/*
计算属性
1.Swift中的计算属性不直接存储值
2.计算属性用于计算, 可以实现set和get这两种计算方法
3.枚举不可以有存储属性, 但是允许有计算属性
结构体和类有存储属性，也有计算属性

Swift中的set(赋值时调用) -> OC中的setter
Swift中的get(取值时调用) -> OC中的getter
*/

struct Rect {
    var origin: (x: Float, y: Float) = (10, 10)
    var size: (width: Float, height: Float) = (100, 100)
    
    // 类和结构体中，没有带下滑线的成员变量
    // 在get方法中，就不能够返回一个带下滑线的成员变量
    // 在set方法中，就不能够对一个带下滑线的成员变量赋值
    // 计算属性
    var center: (x: Float, y: Float) {
        get {
            return (origin.x + size.width * 0.5, origin.y + size.height * 0.5)
        }
        
        // 小括号中的名字为，new ＋ 当前存储属性首字母大写
        // 她的值就是外界赋的值
//        set (newCenter) {
        set {
            // 注意: 计算属性不具备存储功能, 所以不能给计算属性赋值, 如果赋值会发生运行时错误
//            origin.x = newCenter.x - size.width * 0.5
//            origin.y = newCenter.y - size.height * 0.5
            
            // 注意: set可以自己传递一个参数, 也可以使用系统默认的参数newValue
            origin.x = newValue.x - size.width * 0.5
            origin.y = newValue.y - size.height * 0.5
            print("origin \(origin)")

        }
    }
}

var rect = Rect()
print(rect.center)
rect.center = (100, 100)
print(rect.center)


/**
注意：枚举不可以有存储属性, 但是允许有计算属性
*/

enum Type {
    // 枚举不可以有存储属性
//    var name: String = ""
    // 允许有计算属性
    var name: String {
        get {
            return "dahuan"
        }
        set {
            print("set")
        }
    }
}

/*
只读计算属性
OC中readonly修饰的属性就是只读属性，只生成getter方法，不生成getter方法
Swift中的只读计算属性，只实现get方法，不实现set方法
*/

class Person4 {
    // 普通存储属性
    var name: String = "大欢"
    // 只读计算属性
    var age: UInt8 {
        // 只读计算属性的简写, 可以省略get{}
//        get {
            return 18
//        }
    }
}

let person6 = Person4()
print(person6.age)










