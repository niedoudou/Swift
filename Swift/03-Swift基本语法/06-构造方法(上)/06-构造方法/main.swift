//
//  main.swift
//  06-构造方法


import Foundation


/**
构造方法:
作用: 对实例对象的内容进行初始化
Swift要求类或者结构体中的存储属性(非lazy的)在对象构造完毕后要有初始化值
语法:
init(参数列表){ 初始化代码 }
注意：
1.构造方法的作用仅仅是用于初始化属性, 而不是分配内存, 分配内存是系统帮我们做的
2.构造方法是隐式调用的, 通过 类名称() 形式创建一个对象就会隐式调用init()构造方法
3.如果所有的存储属性都有默认值, 可以不提供构造方法, 系统会提供一个隐式的构造方法
*/

class Person: NSObject {
    var name: String
    var age: Int
    var number: NSNumber
    
    // 重写父类的方法必须添加override
    // 在构造方法中，要求对象构造完毕后所有的属性都有初始值
    override init() {
        name = "dahuan"
        age = 18
        number = NSNumber(int: 10086)
    }
    
    // 自定义带参数的构造方法
    // 构造方法中的所有的参数，既是内部参数，也是外部参数
    // Swift中支持方法名重载，同样的名称只要方法名不同就可以
    // Swift中一旦自定义了init方法，但是没有重写默认的init()，那么默认的init()方法就会失效(不能默认的隐私调用init()方法了)
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.number = NSNumber(long: 10086)
    }
}

// 注意： 如果重写了自定义的构造方法，又没有重写父类的init(), 那么，构造的时候不能这么调用Person()
// 如果想继续这么Person()，需要重写父类的init()
let p1 = Person()
let p = Person(name: "xiaohuan", age: 38)
print("name: \(p.name) age: \(p.age), number: \(p.number)")


/**
 派生类的构造方法
 */
class Person1: NSObject {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Student: Person1 {
    var age: UInt8
    
    /*
    注意：
    1.默认情况下构造方法不会被继承
    2.基类的存储属性只能通过基类的构造方法初始化
    3.初始化存储属性的时候，必须先初始化当前类再初始化父类
    */
    init(name: String, age: UInt8) {

        self.age = age
        // super.init必须放在构造方法的最后面
        super.init(name: name)
    }
    
    func show() {
        print("name: \(name), age: \(age)")
    }
}

// 默认情况下构造方法不会被继承
//let stu = Student(name: "大欢") // 错误

let stu = Student(name: "dahuan", age: 18)
stu.show()















