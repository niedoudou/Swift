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


/**
可选属性与构造方法
可选属性可以不设置缺省值，也可以不再构造方法中给属性赋值
如果不对可选属性初始化，那么可选属性的默认值就为nil
*/

class Person2: NSObject {
    // 设置的可选类型属性，那么一定用var来修饰
    var name: String?
    // 定义 "基本数据类型" 最好设置初始值，而不要设置可选值
    // Swift中基本数据类型设置?, 那么调用super.init()不会分配存储空间，那么使用KVC映射的时候就会奔溃(找不到属性)
    var age: UInt8 = 0
    var friends: [String]?
    
    init(dict: [String : AnyObject])
    {
        // 使用KVC赋值之前必须调用super.init()
        // 目的是保证对象创建成功
        super.init()
        
        // self只有当所有的存储属性都初始化完毕之后才可以用
        setValuesForKeysWithDictionary(dict)
    }
    
    func show() {
        print("name: \(name) age: \(age) friends: \(friends)")
    }
}

let dict: [String : AnyObject] = ["name" : "dahuan", "age" : 18, "friends" : ["1", "2", "3"]]
let person2 = Person2(dict: dict)

person2.show()


/**
 结构体构造方法
 在结构体的存储属性中，没有设置缺省值也没有提供构造方法，也能够编译通过
 那是因为结构体提供了一个默认的成员逐一构造器，所以我们初始化的时候直接调用逐一构造方法即可
 */
struct Size {
    var width: Float = 10
    var height: Float = 10
    
    /*
    系统默认提供了类似这样的方法
    init(width: Float, height: Float) {
    self.width = width
    self.height = height
    }
    */
    
    // 如果在结构体中自定义了构造方法，那么系统不会默认生成逐一构造器
//    init(){
//        width = 10
//        height = 90
//    }
}


/*
注意：
1> 在类中默认是没有逐一构造器的
2> 如果在结构体中自定义了构造方法，那么系统不会默认生成逐一构造器
3> 如果给结构体的属性设置了缺省值，系统依旧会提供默认逐一构造器
4> 如果结构体中的属性没有缺省值，那么需要使用逐一构造器初始化(或自定义构造方法)结构体
如果结构体中的属性设置了缺省值，那么可以不用逐一构造器初始化，直接Size()初始化即可
*/


/**
指定构造与便利构造
指定构造方法：指定构造方法都是以init开头的
便利构造方法：被convenience关键字修饰的构造方法称之为便利构造器

便利构造器中一定是调用其它构造方法初始化的, 一定要出现self.init

总结：
指定构造器总是向上代理(父类)
-> 指定构造器中可以调用父类的指定构造器
便利构造器总是横向代理(当前类)
-> 便利构造器只能调用当前类的其他构造方法(指定\便利)

便利构造器必须最终以调用一个指定构造器结束
-> apple这样做是为了保证安全，因为调用子类构造器一定能够初始化所有属性，因为调用父类构造器不一定能完全初始化所有属性(子类特有)
*/

// 引用类型
class Person3: NSObject {
    var name: String?
    var age: Int?
    
    // 指定构造方法
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        // 不能调用当前类中别的构造方法(指定\便利)
//        self.init(name: name)
        
        // 指定构造器中可以调用父类的指定构造器
        // super.init()只能放在构造方法的最后面
        super.init()
    }
    
    // 便利构造方法
    convenience override init() {
        
        // 注意：便利构造器中一定是调用其它构造方法初始化的, 一定要出现self.init
        
        // 便利构造器只能调用当前类的其他构造方法(指定\便利)
        self.init(name: "dahuan")

        
        // 便利构造方法中不能调用父类的构造方法(指定\便利)
//        super.init()
    }
    
    init(name: String) {
        self.name = name
        self.age = 18
    }
}

/**
注意：
如果是值类型(枚举、结构体)可以在构造方法中直接调用别的构造方法
如果是引用类型，直接在构造方法中调用别的构造方法会报错，需要在前面加上convenience关键字
*/
struct Size2 {
    var width: Float
    var height: Float

    // 指定构造方法
    init() {
        self.init(width: 20, height: 30)
    }
    
    init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
}



