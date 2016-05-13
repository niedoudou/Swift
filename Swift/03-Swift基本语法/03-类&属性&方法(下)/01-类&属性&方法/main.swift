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


/*
属性观察器
类似OC中的KVO, 可以用于监听属性什么时候被修改, 只有属性被修改才会调用

有两种属性观察器:
1.willSet, 在设置新值之前调用
2.didSet, 在设置新值之后调用

注意：不能给计算属性和lazy属性添加属性观察器，但是可以在子类中为父类的计算属性提供属性观察器
*/

class Person5 {
    /*
    注意：在结构体和类中，在构造结构体和类的对象的时候，必须保证结构体和类中的属性必须有初始值
    1.给属性设置缺省值（默认值）
    2.给结构体和类添加一个构造方法，使用构造方法给结构体和类的所有属性复制
      -> 结构体中默认有一个逐一构造器
    3.把结构体和类中的属性设置为一个可选类型，可选类型中可能有值也可能没有值(nil)， 只要把属性设置为一个可选类型后，意味着告诉编译器在构造结构体和类的时候不用去管属性有没有初始值
      -> 在使用属性的时候，一定要给属性赋值之后才能使用
    */
    var name: String? {
        // willSet, 在设置新值之前调用
        willSet {
            // newValue即将给name属性赋值的新值
            // 而且这个值为一个可选类型
            print("willSet newValue: \(newValue)")
        }
        // didSet, 在设置新值之后调用
        didSet {
            // oldValue复制之前的旧值
            // 这个oldValue也是一个可选类型
            print("didSet oldValue: \(oldValue)")
            // 现实开发中，我们一般在didSet中使用name来给cell上面的控件赋值
            print("didSet name: \(name)")
        }
    }
}

var person7 = Person5()
person7.name = "dahuan"


/*
类属性
在结构体和枚举中用static
在类中使用class, 并且类中不允许将存储属性设置为类属性
*/

// 结构体
struct Person6 {
    // 普通的属性是每个对象一份
    var name: String?
    // 类属性是所有类对象共用一份
    static var number: String?
    static var age: UInt8 {
        return 18
    }
}

// 构造一个结构体对象
var person8 = Person6(name: "dahuan")
var person9 = Person6(name: "xiaohaun")
// 证明普通的属性是每个对象一份
print("person8: \(person8.name), person9: \(person9.name)")

// 证明类属性是所有类对象共用一份
Person6.number = "10086"
print("number: \(Person6.number)  number: \(Person6.number)")
print("age: \(Person6.age)  age: \(Person6.age)")


// 类
class Person7 {
    // 普通的属性是每个对象一份
    var name: String?
    
    // 属性是所有类对象共用一份
    // 类中不允许将存储属性设置为类属性
//    class var number: String?  错误
    class var age: UInt8 {
        return 18
    }
}

/*
方法:
隶属于每一个类、结构体和枚举的函数称之为方法:
方法分为类方法和实例(对象)方法, 对应OC中的“+” “-”方法
类方法通过类来调用，实例方法通过对象来点用
*/

// 类中的对象方法
// self指当前对象, 如果self在对象方法中代表当前对象
class Person8 {
    var name: String = "dahuan"
    
    // 对像方法
    // 默认情况下，当我们在对象方法中使用属性，编译器默认帮我们在前面加了一个"self."
    // 所以我们可以在对象方法中直接使用"name"
    func show() {
        name = "xiaohuan"
        print(name)
    }
    
    // 当参数名称和属性名称一模一样时, 无法区分哪个是参数哪个是属性, 这个时候可以通过self明确的来区分参数和属性
    func setName(name: String) {
        self.name = name
    }
}

let person10 = Person8()
// 调用对象方法
person10.show()
person10.setName("xiaohua")

/*
mutating方法
值类型(结构体和枚举)默认方法是不可以修改属性的, 如果需要修改属性, 需要在方法前加上mutating关键字, 让该方法变为一个改变方法
*/
// 结构体
struct Person9 {
    var name: String = "xiaoming"
    
    // 值类型(结构体和枚举)默认方法是不可以修改属性的, 如果需要修改属性, 需要在方法前加上mutating关键字
    // 注意: 类不需要, 因为类的实例方法默认就可以修改
    mutating func setName(name: String) {
        self.name = name
    }
}

// 枚举
enum Person10: String {
    case Sex = "sex"
    case Name = "dahuan"
    
    // 注意： 枚举中不能添加存储属性，只能添加计算属性
    var age: Int {
        return 10
    }
    
    mutating func setSex(sex: String) {
        // 通过一个原始值，构造一个枚举
        // 返回值是一个可选类型
        
        // 在枚举对象方法中的self，就是指的是枚举对象
        self = Person10(rawValue: sex)!
    }
}

var sex:Person10 = .Sex
sex = .Name



/*
类方法:
和类属性一样通过类名来调用, 类方法通过static关键字(结构体/枚举), class(类)
*/

struct Person11 {
    var name: String?
    static var age: UInt8?
    
    // 类方法
    static func show()
    {
        var p = Person11()
        p.name = "dahuan"
        // 静态方法中可以直接使用静态属性，但不能直接使用非静态属性
        // 静态方法可以直接调用静态方法，但不能直接调用对象方法
        print("sex: \(Person11.age) name: \(p.name)")
    }
}

Person11.age = 110
Person11.show()


class Person12 {
    var name: String?
    // 类中的存储属性不能设置为类属性
//    class var age: UInt8?
    class var age: UInt8? {
        return 100
    }
    
    // 类方法
    class func show()
    {
        let p = Person12()
        p.name = "dahuan11"
        // 静态方法中可以直接使用静态属性，但不能直接使用非静态属性
        // 静态方法可以直接调用静态方法，但不能直接调用对象方法
        print("sex: \(Person12.age) name: \(p.name)")
    }
}

Person12.show()






